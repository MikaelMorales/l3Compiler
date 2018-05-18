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
    assert(memory_start <= p_addr && p_addr <= memory_end); // TODO: memory_end ???
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

void printHeap() {
  fprintf(stderr, "***********************HEAP STATUS***************************\n");
  uvalue_t* curr = heap_start;
  while (curr < memory_end) {
    uvalue_t sizeCurr = header_unpack_size(*curr);
    fprintf(stderr, "Block of size: %u at %p\n", sizeCurr, curr);
    curr += sizeCurr + HEADER_SIZE;
  }
}

void printFreeList() {
  fprintf(stderr, "***********************Free List***************************\n");
  uvalue_t* curr = free_list;
  while (curr != NULL) {
    fprintf(stderr, "Block of size: %u at %p\n", header_unpack_size(*curr), curr);
    uvalue_t next_virtual = *(curr + HEADER_SIZE);
    curr = next_virtual == NULL ? NULL : addr_v_to_p(next_virtual);
  }
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
  return header_unpack_size(block) > size + HEADER_SIZE; // Splitting is necessary
}

bool is_best_fit(const uvalue_t* current_best, const uvalue_t* candidate, const uvalue_t requested_size) {
  if (candidate == NULL) {
    return false;
  }

  if (current_best == NULL) {
    return candidate != NULL && is_valid_size_block(*candidate, requested_size);
  }

  uvalue_t current_best_size = header_unpack_size(*current_best);;
  uvalue_t new_size = header_unpack_size(*candidate);
  return (new_size < current_best_size && is_valid_size_block(*candidate, requested_size));
}


/**
 * Find best fit, split if necessary, and update the free list
 * @param size requested block size
 * @return pointer to the best fit or null if none is found
 */
uvalue_t* find_best_free_block(const uvalue_t size) {
  if (free_list == NULL || free_list >= memory_end) {
    return NULL;
  }

  // Best fit pointers
  uvalue_t* curr_best = NULL;
  uvalue_t* prev_best = NULL;

  // Pointer to traverse the free list
  uvalue_t* prev = NULL;
  uvalue_t* curr = free_list;

  while (curr != NULL && header_unpack_size(*curr) != size) {
    if (is_best_fit(curr_best, curr, size)) {
      curr_best = curr;
      prev_best = prev;
    }

    // Update pointers
    uvalue_t next_virtual = *(curr + HEADER_SIZE);
    prev = curr;
    curr = next_virtual == NULL ? NULL : addr_v_to_p(next_virtual);
  }

  if (curr != NULL && header_unpack_size(*curr) == size) {
    curr_best = curr;
    prev_best = prev;
  }

  // No match found
  if (curr_best == NULL) {
    return NULL;
  }

  const uvalue_t block_size = header_unpack_size(*curr_best);
  uvalue_t best_next_addr = *(curr_best + HEADER_SIZE);

  // Set next virtual address, if need to split, create the split
  if (block_size != size) {
    uvalue_t* phy_addr = curr_best + size + HEADER_SIZE;
    *phy_addr = header_pack(tag_None, block_size - size - HEADER_SIZE);
    assert((block_size - size - HEADER_SIZE) >= 1);
    // Update next pointer
    *(phy_addr + HEADER_SIZE) = best_next_addr;
    best_next_addr = addr_p_to_v(phy_addr);
  }

  // Update start of free list
  if (prev_best == NULL) {
    free_list = best_next_addr == NULL ? NULL : addr_v_to_p(best_next_addr);
  } else {
    *(prev_best + HEADER_SIZE) = best_next_addr;
  }

  // Remove current pointer from free_list and return it
  return curr_best;
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
  if (is_valid_block_pointer(ptr)) {
    uvalue_t size = header_unpack_size(*ptr);
    unset_block_bitmap(ptr);
    for(size_t i = 1; i <= size; i++) {
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
  return b1 + size + HEADER_SIZE == b2;
}

void sweep() {
  free_list = NULL;
  uvalue_t* prev = NULL;
  uvalue_t* curr = heap_start;
  assert(curr != NULL);

  while (curr < memory_end) {
    assert(curr >= heap_start && curr < memory_end);
    if(is_valid_block_pointer(curr) || header_unpack_tag(*curr) == tag_None) {
      uvalue_t sizeCurr = header_unpack_size(*curr);
      // Coalescing
      if (prev != NULL && are_consecutive_blocks(prev, curr)) {
        uvalue_t sizePrev = header_unpack_size(*prev);
        *prev = header_pack(tag_None, sizePrev + sizeCurr + HEADER_SIZE);
      } else {
        if (free_list == NULL) {
          free_list = curr;
        } else {
          assert(prev != NULL);
          *(prev + HEADER_SIZE) = addr_p_to_v(curr);
        }

        prev = curr;
        *curr = header_pack(tag_None, sizeCurr);
        *(curr + HEADER_SIZE) = NULL; // Might not be necessary
      }
      unset_block_bitmap(curr);
    } else {
      set_block_bitmap(curr);
    }

    // Update curr pointer
    uvalue_t size = header_unpack_size(*curr);
    curr += size + HEADER_SIZE;
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
  *free_list = header_pack(tag_None, (uvalue_t)(memory_end-heap_start-HEADER_SIZE));
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

uvalue_t* memory_allocate(tag_t tag, uvalue_t size) {
  assert(heap_start != NULL);

  const uvalue_t block_size = size != 0 ? size : 1;

  uvalue_t* freeBlock = find_best_free_block(block_size);
  if (freeBlock == NULL) {
    gc_collect();
    freeBlock = find_best_free_block(block_size);
    if (freeBlock == NULL) {
      fail("Mark and Sweep failed !");
    }
  }
  *freeBlock = header_pack(tag, block_size);
  set_block_bitmap(freeBlock);
  uvalue_t* res = freeBlock + HEADER_SIZE;

  return res;
}

uvalue_t memory_get_block_size(uvalue_t* block) {
  return header_unpack_size(block[-1]);
}

tag_t memory_get_block_tag(uvalue_t* block) {
  return header_unpack_tag(block[-1]);
}
