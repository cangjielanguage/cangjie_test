// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(while (a.b){c.d})
    let expr = ParseExpr(input)
    if (expr.isWhileExpr()) {
        var b = expr.asWhileExpr()
        if (b.getCondExpr().asMemberAccess().getBaseExpr().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        if (b.getBody()[0].asExpr().asMemberAccess().getField().value != "d") {
            return 3
        }
        return 0
    }
    return 10
}
