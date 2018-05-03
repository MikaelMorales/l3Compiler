package l3

sealed trait Position

case class FilePosition(fileName: String,
                        line: Int,
                        column: Int) extends Position {
  override def toString: String =
    fileName + ":" + line + ":" + column
}

case object UnknownPosition extends Position {
  override def toString: String =
    "<unknown position>"
}
