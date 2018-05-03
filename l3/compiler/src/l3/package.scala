package object l3 {
  type L3BlockTag = Int
  type L3Int = Int
  type L3Char = Int

  // Uncomment if L3Int is an alias for Long instead of Int
  // import scala.language.implicitConversions
  // implicit def l3IntToInt(i: L3Int): Int =
  //   i.intValue

  val L3_INT_BITS = java.lang.Integer.SIZE - 1

  private def fixedPoint[T](start: T, maxIters: Option[Int])(f: T=>T): T = {
    val approx = Stream.iterate(start, maxIters getOrElse Integer.MAX_VALUE)(f)
    val (improv, stable) = ((approx zip approx.tail) span (p => p._1 != p._2))
    if (improv.isEmpty) stable.head._1 else improv.last._2
  }

  private[l3] def fixedPoint[T](start: T)(f: T=>T): T =
    fixedPoint(start, None)(f)

  private[l3] def fixedPoint[T](start: T, maxIters: Int)(f: T=>T): T =
    fixedPoint(start, Some(maxIters))(f)

  def using[R <: AutoCloseable, T](r: R)(body: R => T): T =
    try {
      body(r)
    } finally {
      if (r != null)
        r.close()
    }
}
