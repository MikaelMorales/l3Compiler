package l3

/**
 * Helper module for IO functions in L₃ and intermediate languages.
 *
 * @author Michel Schinz <Michel.Schinz@epfl.ch>
 */

object IO {
  def readByte(): L3Int =
    System.in.read()

  def writeByte(c: L3Int): Unit = {
    System.out.write(c)
    System.out.flush()
  }
}
