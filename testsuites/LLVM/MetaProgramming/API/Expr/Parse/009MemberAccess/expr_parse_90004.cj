// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(a.b.c.d)
    let expr = ParseExpr(input)
    if (expr.isMemberAccess()) {
        var b = expr.asMemberAccess()
        if (b.getBaseExpr().asMemberAccess().getBaseExpr().asMemberAccess().getBaseExpr().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        if (b.getBaseExpr().asMemberAccess().getBaseExpr().asMemberAccess().getField().value != "b") {
            return 1
        }
        if (b.getBaseExpr().asMemberAccess().getField().value != "c") {
            return 1
        }
        if (b.getField().value != "d") {
            return 2
        }
        return 0
    }
    return 3
}
