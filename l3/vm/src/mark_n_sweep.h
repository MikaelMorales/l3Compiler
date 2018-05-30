#ifndef VM_MARK_N_SWEEP_H
#define VM_MARK_N_SWEEP_H

#include <stdbool.h>
#include "vmtypes.h"

#define MIN(a,b) (((a)<(b))?(a):(b))

#define HEADER_SIZE 1
#define NB_FREE_LISTS 64 // I get better performance with 64 (compared to 32), specially with test/maze.asm Input: 35 1

typedef struct {
    uvalue_t* first;
    uvalue_t* last;
} seg_list;

/******************** Block size utils functions ****************************/
/**
 * Check if the given block size is big enough. If the block is bigger
 * it checks that the splitted block has a size bigger than 1.
 * @param block The block to evaluate
 * @param size The wanted size
 * @return true if the block is valid, false otherwise
 */
bool is_valid_size_block(const uvalue_t block, const uvalue_t size);

/**
 * Check if the new candidate block is better than the current best block.
 * @param current_best Pointer to the current best block
 * @param candidate Pointer to a new candidate block
 * @param requested_size The requested block size
 * @return true if the the new candidate block is better, false otherwise
 */
bool is_best_fit(const uvalue_t* current_best, const uvalue_t* candidate, const uvalue_t requested_size);

/******************** Free lists management ****************************/
/**
 * Reset the content of all the free lists
 */
void reset_free_lists(void);

/**
 * Remove the first element from the free list at position index, and
 * update the free list accordingly.
 * @param index The index of the free list to be modified
 */
void remove_first_from_free_list(const uvalue_t index);

/**
 * Add a new block at the end of the corresponding free list.
 * @param block The block that needs to be added
 */
void add_to_free_list(uvalue_t* block);

/**
 * Find the best block in the last free list containing blocks with variable sizes.
 * It also updates the free list accordingly if a block is found, and if a split is
 * needed, the split block will be added to the correct free list.
 * @param size The requested size of the block
 * @return pointer to a block of the requested size, or NULL if none exist.
 */
uvalue_t* find_best_free_block(const uvalue_t size);

/**
 * Find the best block in one of the free lists with fixed sizes. If these lists are empty or don't contain
 * enough space to return a block of the requested size, it search for a free block in the last free list.
 * It also update the free list accordingly if a block is found.
 * @param size The requested size of the block
 * @return pointer to a block of the requested size, or NULL if none exist.
 */
uvalue_t* find_free_block(const uvalue_t size);

/******************** Bitmap management ****************************/
/**
 * Set the bit of the given block to 1 in the bitmap.
 * @param block The block to update in the bitmap
 */
void set_block_bitmap(const uvalue_t* block);
/**
 * Set the bit of the given block to 0 in the bitmap.
 * @param block The block to update in the bitmap
 */
void unset_block_bitmap(const uvalue_t* block);

/**
 * Search if a pointer is a block or not in the bitmap.
 * If the bitmap contains 1 then the pointer is a block, otherwise it isn't.
 * @param block The block to check in the bitmap
 * @return true if the pointer is block, false otherwise.
 */
bool is_block(uvalue_t* block);


/******************** Mark And Sweep ****************************/
/**
 * Checks if two block are consecutive in memory.
 * @param b1 The first block
 * @param b2 The second block
 * @return true if the block are consecutive, otherwise false.
 */
bool can_coalesce(const uvalue_t* b1, const uvalue_t* b2);

/**
 * Marking phase starting at the given root.
 * @param root The starting point of the marking phase.
 */
void mark(uvalue_t* root);

/**
 * Sweeping phase
 */
void sweep(void);

/**
 * Collect the memory by calling mark and sweep methods
 */
void gc_collect(void);

/******************** Memory Management ****************************/
/**
 * Allocate the bitmap at the beginning of the heap, and update
 * the heap pointer accordingly.
 * @param heap_size Size of the heap
 */
void bitmap_allocation(const size_t heap_size);

/**
 * Allocate the free lists and initialize their starting pointers.
 */
void free_lists_allocation(void);

#endif //VM_MARK_N_SWEEP_H
