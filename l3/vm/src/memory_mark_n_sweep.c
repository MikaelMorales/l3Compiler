#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <assert.h>
#include <string.h>
#include <stdbool.h>

#include "memory.h"
#include "fail.h"
#include "engine.h"

#define MIN(a,b) (((a)<(b))?(a):(b))

#define HEADER_SIZE 1
#define NB_FREE_LISTS 64 // I get better performance with 64 (compared to 32), specially with test/maze.asm Input: 35 1

static uvalue_t* memory_start = NULL;
static uvalue_t* memory_end = NULL;

static uvalue_t* bitmap_start = NULL;
static uvalue_t* heap_start = NULL;

typedef struct {
    uvalue_t* first;
    uvalue_t* last;
} seg_list;

static seg_list free_lists[NB_FREE_LISTS];

/******************** Utils functions ****************************/
static void* addr_v_to_p(const uvalue_t v_addr) {
    return (char*)memory_start + v_addr;
}

static uvalue_t addr_p_to_v(const uvalue_t* p_addr) {
    assert(memory_start <= p_addr && p_addr <= memory_end);
    return (uvalue_t)((char*)p_addr - (char*)memory_start);
}

/******************** Header Managment ****************************/
static uvalue_t header_pack(tag_t tag, uvalue_t size) {
  return (size << 8) | (uvalue_t)tag;
}

static tag_t header_unpack_tag(uvalue_t header) {
  return (tag_t)(header & 0xFF);
}

static uvalue_t header_unpack_size(uvalue_t header) {
  uvalue_t size = header >> 8;
  return size == 0 ? 1 : size; // Blocks of size 0 are actually of size 1 in reality
}

char* memory_get_identity() {
  return "GC: Mark and Sweep";
}

/******************** Block size utils functions ****************************/

/**
 * Check if the given block size is big enough. If the block is bigger
 * it checks that the splitted block has a size bigger than 1.
 * @param block The block to evaluate
 * @param size The wanted size
 * @return true if the block is valid, false otherwise
 */
bool is_valid_size_block(const uvalue_t block, const uvalue_t size) {
  if (header_unpack_size(block) == size) {
    return true;
  }
  // Splitting is necessary: checks that the new block has a sufficient size.
  return header_unpack_size(block) > size + HEADER_SIZE;
}

/**
 * Check if the new candidate block is better than the current best block.
 * @param current_best Pointer to the current best block
 * @param candidate Pointer to a new candidate block
 * @param requested_size The requested block size
 * @return true if the the new candidate block is better, false otherwise
 */
bool is_best_fit(const uvalue_t* current_best, const uvalue_t* candidate, const uvalue_t requested_size) {
  if (candidate == NULL) {
    return false;
  }

  if (current_best == NULL) {
    return candidate != NULL && is_valid_size_block(*candidate, requested_size);
  }

  uvalue_t current_best_size = header_unpack_size(*current_best);
  uvalue_t new_size = header_unpack_size(*candidate);
  return new_size < current_best_size && is_valid_size_block(*candidate, requested_size);
}

/******************** Free lists management ****************************/

/**
 * Reset the content of all the free lists
 */
void reset_free_lists() {
  for (int i=0; i < NB_FREE_LISTS; i++) {
    free_lists[i].first = NULL;
    free_lists[i].last = NULL;
  }
}

/**
 * Remove the first element from the free list at position index, and
 * update the free list accordingly.
 * @param index The index of the free list to be modified
 */
void remove_first_from_free_list(const uvalue_t index) {
  uvalue_t* free_block = free_lists[index].first;
  if (free_block != NULL) {
    if (free_lists[index].first == free_lists[index].last) {
      free_lists[index].first = NULL;
      free_lists[index].last = NULL;
    } else {
      uvalue_t next_virtual = *(free_block + HEADER_SIZE);
      free_lists[index].first = next_virtual == NULL ? NULL : addr_v_to_p(next_virtual);
    }
  }
}

/**
 * Add a new block at the end of the corresponding free list.
 * @param block The block that needs to be added
 */
void add_to_free_list(uvalue_t* block) {
  uvalue_t block_size = header_unpack_size(*block);
  size_t index = MIN(NB_FREE_LISTS-1, block_size-1);
  assert(0 <= index && index < NB_FREE_LISTS);
  seg_list free_list = free_lists[index];
  if (free_list.last == NULL) {
    free_lists[index].last = block;
    free_lists[index].first = block;
  } else {
    *(free_list.last + HEADER_SIZE) = addr_p_to_v(block);
    free_lists[index].last = block;
  }
  *(block + HEADER_SIZE) = NULL;
}

/**
 * Find the best block in the last free list containing blocks with variable sizes.
 * It also updates the free list accordingly if a block is found, and if a split is
 * needed, the split block will be added to the correct free list.
 * @param size The requested size of the block
 * @return pointer to a block of the requested size, or NULL if none exist.
 */
uvalue_t* find_best_free_block(const uvalue_t size) {
  // Best fit pointers
  uvalue_t* curr_best = NULL;
  uvalue_t* prev_best = NULL;

  // Pointer to traverse the free list
  uvalue_t* prev = NULL;
  uvalue_t* curr = free_lists[NB_FREE_LISTS-1].first;

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

  // In case first pointer has the exact size
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

  // Check if split is needed
  if (block_size != size) {
    uvalue_t* phy_addr = curr_best + size + HEADER_SIZE;
    uvalue_t new_size = block_size - size - HEADER_SIZE;
    assert(new_size >= 1);
    *phy_addr = header_pack(tag_None, new_size);

    // Update correct free list or update the last free list
    if (new_size < NB_FREE_LISTS) {
      add_to_free_list(phy_addr);
    } else {
      // Update next pointer of the last free list
      *(phy_addr + HEADER_SIZE) = best_next_addr;
      best_next_addr = addr_p_to_v(phy_addr);
    }
  }

  // Update start of free list if needed
  if (prev_best == NULL) {
    if (best_next_addr == NULL) {
      free_lists[NB_FREE_LISTS-1].first = NULL;
      free_lists[NB_FREE_LISTS-1].last = NULL;
    } else {
      if (free_lists[NB_FREE_LISTS-1].first == free_lists[NB_FREE_LISTS-1].last) {
        free_lists[NB_FREE_LISTS-1].last = addr_v_to_p(best_next_addr);
      }
      free_lists[NB_FREE_LISTS-1].first = addr_v_to_p(best_next_addr);
    }
  } else {
    *(prev_best + HEADER_SIZE) = best_next_addr;
  }

  // Remove current pointer from last free list and return it
  return curr_best;
}

/**
 * Find the best block in one of the free lists with fixed sizes. If these lists are empty or don't contain
 * enough space to return a block of the requested size, it search for a free block in the last free list.
 * It also update the free list accordingly if a block is found.
 * @param size The requested size of the block
 * @return pointer to a block of the requested size, or NULL if none exist.
 */
uvalue_t* find_free_block(const uvalue_t size) {
  const uvalue_t initialIndex = MIN(NB_FREE_LISTS-1, size-1);
  uvalue_t index = initialIndex;

  // Check if requested size is bigger than NB_FREE_LISTS
  if (index == NB_FREE_LISTS -1) {
    return find_best_free_block(size);
  }

  // Check if corresponding free list contains a free block otherwise update the index
  uvalue_t* free_block = free_lists[index].first;
  if (free_block == NULL) {
    // Otherwise a split of size 1 can happen !
    index = index + 2;
  } else {
    remove_first_from_free_list(index);
    return free_block;
  }

  // Iterate over the fixed size free lists to get a block
  while (index < NB_FREE_LISTS-1) {
    free_block = free_lists[index].first;

    if (free_block == NULL) {
      index = MIN(index+1, NB_FREE_LISTS-1);
    } else {
      // Free list at index contains block of size index+1
      uvalue_t currentSize = index + 1;
      // Check if split is needed
      if (currentSize != size) {
        uvalue_t* phy_addr = free_block + size + HEADER_SIZE;
        uvalue_t new_size = currentSize - size - HEADER_SIZE;
        assert(new_size >= 1);
        *phy_addr = header_pack(tag_None, new_size);
        add_to_free_list(phy_addr);
      }
      remove_first_from_free_list(index);
      return free_block;
    }
  }

  // Fallback in case no block was found
  return find_best_free_block(size);
}

/******************** Bitmap management ****************************/
/**
 * Set the bit of the given block to 1 in the bitmap.
 * @param block The block to update in the bitmap
 */
void set_block_bitmap(const uvalue_t* block) {
  assert(block >= heap_start && block < memory_end);
  assert(heap_start != NULL);
  assert(bitmap_start != NULL);
  const size_t index = block - heap_start;
  const size_t row = index / VALUE_BITS;
  const size_t col = index % VALUE_BITS;
  bitmap_start[row] |= 1u << col;
}

/**
 * Set the bit of the given block to 0 in the bitmap.
 * @param block The block to update in the bitmap
 */
void unset_block_bitmap(const uvalue_t* block) {
  assert(block >= heap_start && block < memory_end);
  assert(heap_start != NULL);
  assert(bitmap_start != NULL);
  const size_t index = block - heap_start;
  const size_t row = index / VALUE_BITS;
  const size_t col = index % VALUE_BITS;
  bitmap_start[row] &= ~(1u << col);
}

/**
 * Search if a pointer is a block or not in the bitmap.
 * If the bitmap contains 1 then the pointer is a block, otherwise it isn't.
 * @param block The block to check in the bitmap
 * @return true if the pointer is block, false otherwise.
 */
bool is_block(const uvalue_t* block) {
  if (block < heap_start || block >= memory_end) {
    return false;
  }
  assert((addr_p_to_v(block) & 0x03u) == 0);
  assert(heap_start != NULL);
  assert(bitmap_start != NULL);

  const size_t index = block - heap_start;
  const size_t row = index / VALUE_BITS;
  const size_t col = index % VALUE_BITS;
  const size_t mask = 1u << col;
  return (bitmap_start[row] & mask) != 0;
}


/******************** Mark And Sweep ****************************/
/**
 * Checks if two block are consecutive in memory.
 * @param b1 The first block
 * @param b2 The second block
 * @return true if the block are consecutive, otherwise false.
 */
bool can_coalesce(const uvalue_t* b1, const uvalue_t* b2) {
  assert(b1 < b2);
  uvalue_t size = header_unpack_size(*b1);
  return b1 + size + HEADER_SIZE == b2;
}

/**
 * Marking phase starting at the given root.
 * @param root The starting point of the marking phase.
 */
void mark(uvalue_t* root) {
  // Get the header of the block, since user have pointers to bodies
  root = root - HEADER_SIZE;

  if (is_block(root)) {
    uvalue_t size = header_unpack_size(*root);
    unset_block_bitmap(root);
    for(size_t i = 1; i <= size; i++) {
      uvalue_t child = root[i];
      // Block addresses should be byte aligned
      if ((child & 0x03u) == 0) {
        mark(addr_v_to_p(child));
      }
    }
  }
}

void sweep() {
  reset_free_lists();

  uvalue_t* prev = NULL;
  uvalue_t* curr = heap_start;
  assert(curr != NULL);

  while (curr < memory_end) {
    assert(curr >= heap_start && curr < memory_end);
    // Check if block can be freed
    if(is_block(curr) || header_unpack_tag(*curr) == tag_None) {
      uvalue_t sizeCurr = header_unpack_size(*curr);

      if (prev != NULL && can_coalesce(prev, curr)) {
        // Coalescing can be done, it updates the size of the block
        uvalue_t sizePrev = header_unpack_size(*prev);
        *prev = header_pack(tag_None, sizePrev + sizeCurr + HEADER_SIZE);
      } else {
        if (prev != NULL) {
          // Non-consecutive blocks, we can add prev to the corresponding free list
          add_to_free_list(prev);
        }

        prev = curr;
        *curr = header_pack(tag_None, sizeCurr); // Reset tag
        *(curr + HEADER_SIZE) = NULL; // Reset body
      }
      // Update the bitmap, since this block is free
      unset_block_bitmap(curr);
    } else {
      // This block is allocated and can't be freed, hence the bitmap is updated
      set_block_bitmap(curr);
    }

    // Update curr pointer
    uvalue_t size = header_unpack_size(*curr);
    curr += size + HEADER_SIZE;
  }

  // Check if the last prev pointer wasn't added to a free list
  if (prev != NULL && header_unpack_tag(*prev) == tag_None) {
    add_to_free_list(prev);
  }
}

void gc_collect() {
  mark(engine_get_Ib());
  mark(engine_get_Ob());
  mark(engine_get_Lb());

  sweep();
}

/******************** Memory Management ****************************/
void memory_setup(size_t total_byte_size) {
  memory_start = calloc(total_byte_size, 1);
  if (memory_start == NULL)
    fail("cannot allocate %zd bytes of memory", total_byte_size);

  memory_end = memory_start + (total_byte_size / sizeof(value_t));
}

void memory_cleanup() {
  assert(memory_start != NULL);
  reset_free_lists();
  free(memory_start);
  memory_start = memory_end = NULL;
  heap_start = bitmap_start = NULL;
}

void* memory_get_start() {
  return memory_start;
}

void* memory_get_end() {
  return memory_end;
}

void bitmap_allocation(const size_t heap_size) {
  size_t bitmap_size = heap_size / VALUE_BITS;
  bitmap_size += heap_size % VALUE_BITS == 0 ? 0 : 1;

  bitmap_start = heap_start;
  heap_start = heap_start + bitmap_size;
  memset(bitmap_start, 0, bitmap_size);
}

void free_lists_allocation() {
  reset_free_lists();
  free_lists[NB_FREE_LISTS-1].first = heap_start;
  free_lists[NB_FREE_LISTS-1].last = heap_start;
  uvalue_t* ptr = free_lists[NB_FREE_LISTS-1].first;
  *ptr = header_pack(tag_None, (uvalue_t)(memory_end-heap_start-HEADER_SIZE));
  assert(ptr != NULL);
}

void memory_set_heap_start(void* heap_start_ptr) {
  assert(heap_start == NULL);
  heap_start = heap_start_ptr;

  size_t heap_size = memory_end - heap_start;

  assert(heap_size > 2);
  bitmap_allocation(heap_size);
  free_lists_allocation();
}

uvalue_t* memory_allocate(tag_t tag, uvalue_t size) {
  assert(heap_start != NULL);

  const uvalue_t block_size = size != 0 ? size : 1;

  uvalue_t* freeBlock = find_free_block(block_size);
  if (freeBlock == NULL) {
    gc_collect();
    freeBlock = find_free_block(block_size);
    if (freeBlock == NULL) {
      fail("Unable to allocate block of size %u\n", size);
    }
  }

  *freeBlock = header_pack(tag, size);
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