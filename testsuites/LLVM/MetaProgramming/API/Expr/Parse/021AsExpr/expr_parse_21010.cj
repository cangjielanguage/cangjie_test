// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input: Tokens = quote((a) as A)
    let expr = ParseExpr(input)
    if (expr.isAsExpr()) {
        var b = expr.asAsExpr()
        if (b.getExpr().asParenExpr().getExpr().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        if (b.getType().asRefType().getIdentifier().value != "A") {
            return 2
        }
        return 0
    }
    return 3
}
