package l3

/**
 * Bit twiddling utility module.
 * Parts taken from http://graphics.stanford.edu/~seander/bithacks.html
 *
 * @author Michel Schinz <Michel.Schinz@epfl.ch>
 */

object BitTwiddling {
  def bitsToIntMSBF(bits: Int*): Int =
    (0 /: bits){ (v, b) => (v << 1) | b }

  def fitsInNSignedBits(bits: Int)(value: L3Int): Boolean = {
    require(0 <= bits && bits <= L3_INT_BITS)
    val value1 = value >> (bits - 1)
    value1 == 0 || value1 == -1
  }

  def fitsInNUnsignedBits(bits: Int)(value: L3Int): Boolean = {
    require(0 <= bits && bits <= L3_INT_BITS)
    0 <= value && value < (1 << bits)
  }
}
