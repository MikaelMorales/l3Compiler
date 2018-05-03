package l3

import l3.{ NominalCL3TreeModule => N }
import l3.{ SymbolicCL3TreeModule => S }

/**
 * Name analysis for the CL₃ language. Translates a tree in which
 * identifiers are simple strings into one in which identifiers are
 * symbols (i.e. globally-unique names).
 *
 * @author Michel Schinz <Michel.Schinz@epfl.ch>
 */

object CL3NameAnalyzer extends (N.Tree => S.Tree) {
  def apply(tree: N.Tree): S.Tree =
    transform(tree)(Map.empty)

  private type Env = Map[String, Symbol]

  private def transform(tree: N.Tree)(implicit env: Env): S.Tree = {
    implicit val pos = tree.pos
    tree match {
      case N.Let(bdgs, body) =>
        val syms = checkUnique(pos, bdgs map (_._1)) map Symbol.fresh
        S.Let(syms zip (bdgs map { b => transform(b._2) }),
              transform(body)(augmented(env, syms)))
      case N.LetRec(funs, body) =>
        val syms = checkUnique(pos, funs map (_.name)) map Symbol.fresh
        val env1 = augmented(env, syms)
        S.LetRec((syms zip funs) map {case (s,f) => transformFD(s, f , env1)},
                 transform(body)(env1))
      case N.If(cond, thenE, elseE) =>
        S.If(transform(cond), transform(thenE), transform(elseE))
      case N.App(N.Ident(fun), args) if env contains altName(fun, args.length)=>
        S.App(S.Ident(env(altName(fun, args.length))), args map transform)
      case N.App(fun, args) =>
        S.App(transform(fun), args map transform)
      case N.Prim(p, args) if L3Primitive isDefinedAt (p, args.length) =>
        S.Prim(L3Primitive(p), args map transform)
      case N.Halt(arg) =>
        S.Halt(transform(arg))
      case N.Ident(name) if env contains name =>
        S.Ident(env(name))
      case N.Lit(value) =>
        S.Lit(value)

      case N.Prim(p, _) if L3Primitive isDefinedAt p =>
        Reporter.fatalError(tree.pos, s"incorrect number of arguments for @$p")
      case N.Prim(p, _) =>
        Reporter.fatalError(tree.pos, s"unknown primitive $p")
      case N.Ident(name) =>
        Reporter.fatalError(tree.pos, s"unknown identifier $name")
    }
  }

  private def transformFD(funSym: Symbol, fun: N.FunDef, env: Env): S.FunDef = {
    implicit val pos = fun.pos
    val argsSyms = checkUnique(pos, fun.args) map Symbol.fresh
    S.FunDef(funSym, argsSyms, transform(fun.body)(augmented(env, argsSyms)))
  }

  private def checkUnique(pos: Position, names: Seq[String]): Seq[String] = {
    for (n <- names diff names.distinct)
      Reporter.fatalError(pos, s"repeated definition of $n")
    names
  }

  private def altName(name: String, arity: Int): String =
    s"$name@$arity"

  private def augmented(env: Env, symbols: Seq[Symbol]): Env =
    env ++ (symbols map { s => (s.name, s) })
}
