// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(do {b;c;d} while (a))
    let expr = ParseExpr(input)
    if (expr.isDoWhileExpr()) {
        var b = expr.asDoWhileExpr()
        if (b.getCondExpr().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        if (b.getBody()[2].asExpr().asRefExpr().getIdentifier().value != "d") {
            return 2
        }
        return 0
    }
    return 3
}
