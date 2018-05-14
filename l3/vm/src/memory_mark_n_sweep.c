#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <assert.h>
#include <string.h>
#include <stdbool.h>

#include "memory.h"
#include "fail.h"
#include "engine.h"

static uvalue_t* memory_start = NULL;
static uvalue_t* memory_end = NULL;

static uvalue_t* free_list = NULL;
static uvalue_t* bitmap_start = NULL;
static uvalue_t* heap_start = NULL;

#define HEADER_SIZE 1

// Utils
static void* addr_v_to_p(uvalue_t v_addr) {
    return (char*)memory_start + v_addr;
}

static uvalue_t addr_p_to_v(uvalue_t* p_addr) {
    assert(memory_start <= p_addr && p_addr <= memory_end);
    return (uvalue_t)((char*)p_addr - (char*)memory_start);
}

// Header management
static uvalue_t header_pack(tag_t tag, uvalue_t size) {
  return (size << 8) | (uvalue_t)tag;
}

static tag_t header_unpack_tag(uvalue_t header) {
  return (tag_t)(header & 0xFF);
}

static uvalue_t header_unpack_size(uvalue_t header) {
  return header >> 8;
}

char* memory_get_identity() {
  return "GC: Mark and Sweep";
}

void memory_setup(size_t total_byte_size) {
  memory_start = calloc(total_byte_size, 1);
  if (memory_start == NULL)
    fail("cannot allocate %zd bytes of memory", total_byte_size);

  memory_end = memory_start + (total_byte_size / sizeof(value_t));
}

void memory_cleanup() {
  assert(memory_start != NULL);
  free(memory_start);
  memory_start = memory_end = NULL;
  heap_start = free_list = bitmap_start = NULL;
}

bool is_valid_size_block(const uvalue_t block, const uvalue_t size) {
  if (header_unpack_size(block) == size) {
    return true;
  }
  return header_unpack_size(block) > size + HEADER_SIZE;
}

/**
 * Find first fit, split if necessary, and update the free list
 * @param size
 * @return pointer to the first fit or null if none is found
 */
uvalue_t* find_free_block(const uvalue_t size) {
  uvalue_t* current_pointer = free_list;
  uvalue_t* previous_pointer = NULL;
  while (current_pointer != NULL && !is_valid_size_block(*current_pointer, size)) {
    uvalue_t next_virtual = *(current_pointer + HEADER_SIZE);
    previous_pointer = current_pointer;
    current_pointer = next_virtual == NULL ? NULL : addr_v_to_p(next_virtual);
  }
  // No match found
  if (current_pointer == NULL) {
    //fprintf(stderr, "Free block NOT FOUND !\n");
    return NULL;
  }

  const uvalue_t block_size = header_unpack_size(*current_pointer);
  uvalue_t next_addr;
  //fprintf(stderr, "*************FOUND*****************\n");
  //fprintf(stderr, "Address at: %p\n", current_pointer);
  //fprintf(stderr, "Block size of: %u\n", block_size);
  //fprintf(stderr, "Requested: %u\n", size);

  // Set next virtual address, if need to split, create the split
  if (block_size != size) {
    uvalue_t* phy_addr = current_pointer + size;
    next_addr = addr_p_to_v(phy_addr);
    *phy_addr = header_pack(tag_None, block_size - size);
    assert(block_size-size >= 2);

    // Update next pointer
    *(phy_addr + HEADER_SIZE) = *(current_pointer + HEADER_SIZE);
    //fprintf(stderr, "Splitting:\n");
    //fprintf(stderr, "Block splitted at: %p\n", phy_addr);
    //fprintf(stderr, "With size: %u\n", block_size - size);
  } else {
    next_addr = *(current_pointer + HEADER_SIZE);
  }

  // Update start of free list
  if (previous_pointer == NULL) {
    free_list = next_addr == NULL ? NULL : addr_v_to_p(next_addr);
  } else {
    *(previous_pointer + HEADER_SIZE) = next_addr;
  }

  // Remove current pointer from free_list
  return current_pointer;
}

void set_block_bitmap(const uvalue_t* block) {
  assert(block >= heap_start && block < memory_end);
  assert(heap_start != NULL);
  assert(bitmap_start != NULL);
  const size_t index = block - heap_start;
  const size_t row = index / VALUE_BITS;
  const size_t col = index % VALUE_BITS;
  bitmap_start[row] |= 1u << col;
}

void unset_block_bitmap(const uvalue_t* block) {
  assert(block >= heap_start && block < memory_end);
  assert(heap_start != NULL);
  assert(bitmap_start != NULL);
  const size_t index = block - heap_start;
  const size_t row = index / VALUE_BITS;
  const size_t col = index % VALUE_BITS;
  bitmap_start[row] &= ~(1u << col);
}

bool is_valid_block_pointer(uvalue_t* block) {
  if (block < heap_start || block >= memory_end) {
    return false;
  }
  assert(addr_p_to_v(block) % 4 == 0);
  assert(heap_start != NULL);
  assert(bitmap_start != NULL);

  const size_t index = block - heap_start;
  const size_t row = index / VALUE_BITS;
  const size_t col = index % VALUE_BITS;
  const size_t mask = 1u << col;
  return (bitmap_start[row] & mask) != 0;
}

void mark(uvalue_t* ptr) {
  ptr = ptr - HEADER_SIZE;
  if (heap_start <= ptr && ptr < memory_end && is_valid_block_pointer(ptr)) {
    uvalue_t size = header_unpack_size(*ptr);
    unset_block_bitmap(ptr);
    for(size_t i = 1; i < size; i++) {
      uvalue_t child = ptr[i];

      // Block addresses should be byte aligned
      if ((child & 0x03u) == 0) {
        mark(addr_v_to_p(child));
      }
    }
  }
}

bool are_consecutive_blocks(const uvalue_t* b1, const uvalue_t* b2) {
  assert(b1 < b2);
  uvalue_t size = header_unpack_size(*b1);
  return b1 + size == b2;
}

void sweep() {
  free_list = NULL;
  uvalue_t* prev = NULL;
  uvalue_t* curr = heap_start;
  assert(curr != NULL);

  while (curr < memory_end) {
    //fprintf(stderr, "Curr: %p \n", curr);
    //fprintf(stderr, "Prev: %p \n", prev);
    assert(curr >= heap_start && curr < memory_end);
    if(is_valid_block_pointer(curr) || header_unpack_tag(*curr) == tag_None) { // added none tag
      uvalue_t sizeCurr = header_unpack_size(*curr);
      // Coalescing
      if (prev != NULL && are_consecutive_blocks(prev, curr)) {
        uvalue_t sizePrev = header_unpack_size(*prev);
        *prev = header_pack(tag_None, sizePrev + sizeCurr);
      } else {
        if (free_list == NULL) {
          free_list = curr;
        } else {
          assert(prev != NULL);
          *(prev + HEADER_SIZE) = addr_p_to_v(curr);
        }

        prev = curr;
        *curr = header_pack(tag_None, sizeCurr);
        *(curr + HEADER_SIZE) = NULL;
      }
      unset_block_bitmap(curr);
    } else {
      set_block_bitmap(curr);
    }

    // Update curr pointer
    uvalue_t size = header_unpack_size(*curr);
    //fprintf(stderr, "Size: %u \n", size);
    curr += size;
  }
}

void gc_collect() {
  mark(engine_get_Ib());
  mark(engine_get_Ob());
  mark(engine_get_Lb());

  sweep();
}

void* memory_get_start() {
  return memory_start;
}

void* memory_get_end() {
  return memory_end;
}

void bitmap_allocation(size_t heap_size) {
  size_t bitmap_size = heap_size / VALUE_BITS;
  bitmap_size += heap_size % VALUE_BITS == 0 ? 0 : 1;

  bitmap_start = heap_start;
  heap_start = heap_start + bitmap_size;
  free_list = heap_start;
  *free_list = header_pack(tag_None, (uvalue_t)(memory_end-heap_start));
  assert(free_list != NULL);
  memset(bitmap_start, 0, bitmap_size);
}

void memory_set_heap_start(void* heap_start_ptr) {
  assert(heap_start == NULL);
  heap_start = heap_start_ptr;

  // Memory_end exclusive
  size_t heap_size = memory_end - heap_start;

  assert(heap_size > 2);
  bitmap_allocation(heap_size);
}

void printHeap() {
  fprintf(stderr, "***********************HEAP STATUS***************************\n");
  uvalue_t* curr = heap_start;
  while (curr < memory_end) {
    uvalue_t sizeCurr = header_unpack_size(*curr);
    fprintf(stderr, "Block of size: %u at %p\n", sizeCurr, curr);
    curr += sizeCurr;
  }
}

uvalue_t* memory_allocate(tag_t tag, uvalue_t size) {
  assert(heap_start != NULL);
  size = size != 0 ? size : 1;
  const uvalue_t total_size = size + HEADER_SIZE;

  uvalue_t* freeBlock = find_free_block(total_size);
  if (freeBlock == NULL) {
    //printHeap();
    //fprintf(stderr, "End: %p", memory_end);
    gc_collect();
    freeBlock = find_free_block(total_size);
    if (freeBlock == NULL) {
      fail("Mark and Sweep failed !");
    }
  }

  assert(total_size >= 2);
  *freeBlock = header_pack(tag, total_size);
  set_block_bitmap(freeBlock);
  uvalue_t* res = freeBlock + HEADER_SIZE;
  //fprintf(stderr, "Block of size: %u at %p\n", total_size, freeBlock);

  return res;
}

uvalue_t memory_get_block_size(uvalue_t* block) {
  return header_unpack_size(block[-1]);
}

tag_t memory_get_block_tag(uvalue_t* block) {
  return header_unpack_tag(block[-1]);
}
