// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(a.b<T,Int64>)
    let expr = ParseExpr(input)
    if (expr.isMemberAccess()) {
        var b = expr.asMemberAccess()
        if (b.getBaseExpr().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        if (b.getField().value != "b") {
            return 2
        }
        if (!b.hasArgs()) {
            return 4
        }
        if (b.getArgs()[0].asRefType().getIdentifier().value != "T") {
            return 5
        }
        if (b.getArgs()[1].asPrimitiveType().getPrimitive().value != "Int64") {
            return 5
        }
        return 0
    }
    return 3
}
