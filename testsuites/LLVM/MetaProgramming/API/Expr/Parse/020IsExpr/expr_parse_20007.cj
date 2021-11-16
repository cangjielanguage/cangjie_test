// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(!b is A)
    let expr = ParseExpr(input)
    if (expr.isIsExpr()) {
        var b = expr.asIsExpr()
        if (b.getExpr().asUnaryExpr().getExpr().asRefExpr().getIdentifier().value != "b") {
            return 1
        }
        if (b.getType().asRefType().getIdentifier().value != "A") {
            return 2
        }
        return 0
    }
    return 3
}
