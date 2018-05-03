package l3

import BitTwiddling.fitsInNSignedBits
import collection.mutable.{ Map => MutableMap }

import RegisterCPSTreeModule._
import LabeledASMInstructionModule._

/**
 * An ASM code generator for CPS/L₃.
 *
 * @author Michel Schinz <Michel.Schinz@epfl.ch>
 */

object CPSToASMTranslator extends (Tree => LabeledProgram) {
  private val I3 = ASMRegisterFile.in(3)

  def apply(tree: Tree): LabeledProgram = {
    val conts = MutableMap[Symbol, Tree]()

    def linearize(tree: Tree, acc: LabeledProgram = Seq()): LabeledProgram = {
      def contOrJump(l: Symbol): LabeledProgram =
        ((conts remove l map { b => labeled(l, linearize(b)) })
           getOrElse Seq(nl(JI(l))))

      def prelude(body: Tree): LabeledProgram = {
        def usedRegs(tree: Tree): Set[ASMRegister] = {
          val O0_to_O4 = ((0 to 4) map ASMRegisterFile.out).toSet

          def regIn(n: Name): Set[ASMRegister] = n match {
            case Reg(r) => Set(r)
            case Label(_) => Set.empty
          }

          def regsIn(ns: Seq[Name]): Set[ASMRegister] =
            ((Set.empty : Set[ASMRegister]) /: (ns map regIn))(_ | _)

          (tree: @unchecked) match {
            case LetL(Reg(a), _, body) =>
              Set(a) | usedRegs(body)
            case LetL(Label(_), _, _) =>
              sys.error(s"invalid node: $tree")
            case LetP(Reg(a), _, args, body) =>
              Set(a) | regsIn(args) | usedRegs(body)
            case LetC(cnts, body) =>
              ((Set[ASMRegister]() /: cnts) {
                 case (r, c) => r | regsIn(c.args) | usedRegs(c.body) }
                 | usedRegs(body))
            case LetF(_, body) =>
              usedRegs(body)
            case AppC(c, args) =>
              regIn(c) | regsIn(args)
            case AppF(f, retC, args) =>
              regIn(f) | regIn(retC) | regsIn(args) | O0_to_O4
            case If(_, args, tc, ec) =>
              regsIn(args) | regIn(tc) | regIn(ec)
            case Halt(arg) =>
              regIn(arg)
          }
        }

        def maybeAlloc(b: ASMBaseRegister, rs: Set[ASMRegister]) = {
          val basedRS = rs collect { case r if r.base == b => r.index }
          if (basedRS.nonEmpty) Seq(nl(RALO(b, basedRS.max + 1))) else Seq()
        }

        val rs = usedRegs(body)
        maybeAlloc(ASMRegisterFile.Lb, rs) ++ maybeAlloc(ASMRegisterFile.Ob, rs)
      }

      def condJump(p: CPSTestPrimitive,
                   a: ASMRegister,
                   b: ASMRegister,
                   w: Boolean,
                   c: Symbol) =
        (p, w) match {
          case (CPSLt, true)                  => nl(JLT(a, b, LabelC(c)))
          case (CPSLt, false)                 => nl(JLE(b, a, LabelC(c)))
          case (CPSLe, true)                  => nl(JLE(a, b, LabelC(c)))
          case (CPSLe, false)                 => nl(JLT(b, a, LabelC(c)))
          case (CPSEq, true) | (CPSNe, false) => nl(JEQ(a, b, LabelC(c)))
          case (CPSNe, true) | (CPSEq, false) => nl(JNE(a, b, LabelC(c)))
        }

      tree match {
        case LetL(Reg(a), v, body) if fitsInNSignedBits(18)(v) =>
          linearize(body, acc :+ nl(LDLO(a, IntC(v))))
        case LetL(Reg(a), v, body) =>
          val lsb16: Int = v & 0xFFFF
          val msb16: Int = v >>> 16
          linearize(body, acc :+ nl(LDLO(a, IntC(lsb16))) :+ nl(LDHI(a, msb16)))

        case LetP(Reg(a), CPSAdd, Seq(Reg(b), Reg(c)), body) =>
          linearize(body, acc :+ nl(ADD(a, b, c)))
        case LetP(Reg(a), CPSSub, Seq(Reg(b), Reg(c)), body) =>
          linearize(body, acc :+ nl(SUB(a, b, c)))
        case LetP(Reg(a), CPSMul, Seq(Reg(b), Reg(c)), body) =>
          linearize(body, acc :+ nl(MUL(a, b, c)))
        case LetP(Reg(a), CPSDiv, Seq(Reg(b), Reg(c)), body) =>
          linearize(body, acc :+ nl(DIV(a, b, c)))
        case LetP(Reg(a), CPSMod, Seq(Reg(b), Reg(c)), body) =>
          linearize(body, acc :+ nl(MOD(a, b, c)))

        case LetP(Reg(a), CPSShiftLeft, Seq(Reg(b), Reg(c)), body) =>
          linearize(body, acc :+ nl(LSL(a, b, c)))
        case LetP(Reg(a), CPSShiftRight, Seq(Reg(b), Reg(c)), body) =>
          linearize(body, acc :+ nl(LSR(a, b, c)))
        case LetP(Reg(a), CPSAnd, Seq(Reg(b), Reg(c)), body) =>
          linearize(body, acc :+ nl(AND(a, b, c)))
        case LetP(Reg(a), CPSOr, Seq(Reg(b), Reg(c)), body) =>
          linearize(body, acc :+ nl(OR(a, b, c)))
        case LetP(Reg(a), CPSXOr, Seq(Reg(b), Reg(c)), body) =>
          linearize(body, acc :+ nl(XOR(a, b, c)))

        case LetP(Reg(a), CPSByteRead, Seq(), body) =>
          linearize(body, acc :+ nl(BREA(a)))
        case LetP(_, CPSByteWrite, Seq(Reg(a)), body) =>
          linearize(body, acc :+ nl(BWRI(a)))

        case LetP(Reg(a), CPSBlockAlloc(t), Seq(Reg(b)), body) =>
          linearize(body, acc :+ nl(BALO(a, b, t)))
        case LetP(Reg(a), CPSBlockTag, Seq(Reg(b)), body) =>
          linearize(body, acc :+ nl(BTAG(a, b)))
        case LetP(Reg(a), CPSBlockLength, Seq(Reg(b)), body) =>
          linearize(body, acc :+ nl(BSIZ(a, b)))
        case LetP(Reg(a), CPSBlockGet, Seq(Reg(b), Reg(c)), body) =>
          linearize(body, acc :+ nl(BGET(a, b, c)))
        case LetP(_, CPSBlockSet, Seq(Reg(a), Reg(b), Reg(c)), body) =>
          linearize(body, acc :+ nl(BSET(c, a, b)))

        case LetP(Reg(a), CPSId, Seq(Reg(b)), body) if a == b =>
          linearize(body, acc)
        case LetP(Reg(a), CPSId, Seq(Reg(b)), body) =>
          linearize(body, acc :+ nl(MOVE(a, b)))
        case LetP(Reg(a), CPSId, Seq(Label(l)), body) =>
          linearize(body, acc :+ nl(LDLO(a, LabelC(l))))

        case LetC(cnts, body) =>
          conts ++= cnts map { case CntDef(Label(name), _, body) => name->body }
          linearize(body, acc)

        case LetF(funs, body) =>
          assume(acc.isEmpty)
          val lFuns = funs map { case FunDef(Label(name), _, _, funBody) =>
            labeled(name, linearize(funBody, prelude(funBody)))
          }
          (linearize(body, prelude(body)) +: lFuns).flatten

        case AppC(Label(c), _) =>
          acc ++ contOrJump(c)
        case AppC(Reg(I3), _) =>
          acc :+ nl(RET)

        case AppF(Reg(fun), Label(rc), _) =>
          (acc :+ nl(CALL(fun))) ++ contOrJump(rc)
        case AppF(Reg(fun), Reg(I3), _) =>
          acc :+ nl(TCAL(fun))

        case If(p, Seq(Reg(a), Reg(b)), Label(thenC), Label(elseC)) =>
          (conts remove thenC, conts remove elseC) match {
            case (Some(thenT), Some(elseT)) =>
              val thenP = labeled(thenC, linearize(thenT))
              val elseP = labeled(elseC, linearize(elseT))
              (acc :+ condJump(p, a, b, false, elseC)) ++ thenP ++ elseP
            case (Some(thenT), None) =>
              val thenP = labeled(thenC, linearize(thenT))
              (acc :+ condJump(p, a, b, false, elseC)) ++ thenP
            case (None, Some(elseT)) =>
              val elseP = labeled(elseC, linearize(elseT))
              (acc :+ condJump(p, a, b, true, thenC)) ++ elseP
            case (None, None) =>
              acc :+ condJump(p, a, b, true, thenC) :+ nl(JI(elseC))
          }

        case Halt(Reg(arg)) =>
          acc :+ nl(HALT(arg))
      }
    }
    linearize(tree)
  }
}
