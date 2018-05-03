package l3

import java.io.PrintWriter
import java.nio.file.{ Files, Paths }
import fastparse.core.Parsed.{ Success, Failure }
import CL3TreeFormatter._
import CPSTreeFormatter._

object Main {
  def main(args: Array[String]): Unit = {
    if (args.isEmpty)
      fatalError("no input file given")
    val filesNotFound =
      args.filterNot(a => Files.exists(Paths.get(a))).mkString(", ")
    if (! filesNotFound.isEmpty)
      fatalError(s"file(s) not found: ${filesNotFound}")

    val basePath = Paths.get(".").toAbsolutePath
    val inFiles = L3FileReader.expandModules(basePath, args)
    val (programText, indexToPos) = L3FileReader.readFiles(basePath, inFiles)

    L3Parser.parse(programText, indexToPos) match {
      case Success(program, _) =>
        val backEnd = (
          CL3NameAnalyzer
            // andThen CL3Interpreter
            andThen CL3ToCPSTranslator
            // andThen treePrinter("----- After CPS translation -----")
            andThen CPSOptimizerHigh
            // andThen treePrinter("----- After high opt -----")
            // andThen CPSInterpreterHigh
            andThen CPSContifier
            andThen CPSValueRepresenter
            // andThen treePrinter("----- After value repr. -----")
            andThen CPSOptimizerLow
            // andThen treePrinter("----- After low opt -----")
            andThen CPSHoister
            // andThen CPSInterpreterLow
            andThen CPSRegisterAllocator
            andThen CPSToASMTranslator
            andThen ASMLabelResolver
            // andThen ASMInterpreter
            andThen ASMFileWriter("out.asm")
        )
        try {
          backEnd(program)
        } catch {
          case L3FatalError(msg) =>
            fatalError(msg)
        }

      case Failure(lp, index, _) =>
        fatalError(s"${indexToPos(index)}: parse error (expected: $lp)")
    }
  }

  def passThrough[T](f: T => Unit): T=>T = { t: T => f(t); t }

  lazy val outPrintWriter = new PrintWriter(System.out, true)

  def treePrinter[T](msg: String)(implicit f: Formatter[T]): T => T =
    passThrough { tree =>
      outPrintWriter.println(msg)
      f.toDoc(tree).writeTo(80, outPrintWriter)
      outPrintWriter.println()
    }

  def seqPrinter[T](msg: String): Seq[T] => Seq[T] =
    passThrough { program =>
      outPrintWriter.println(msg)
      program foreach outPrintWriter.println
    }

  private[this] def fatalError(msg: String): Nothing = {
    println(s"Error: ${msg}")
    sys.exit(1)
  }
}
