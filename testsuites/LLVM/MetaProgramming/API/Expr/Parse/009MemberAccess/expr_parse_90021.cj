// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(a.b<T,V>)
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
        if (b.getArgs()[1].asRefType().getIdentifier().value != "V") {
            return 6
        }
        return 0
    }
    return 3
}
