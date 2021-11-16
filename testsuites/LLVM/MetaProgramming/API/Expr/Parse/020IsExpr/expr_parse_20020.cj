// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input: Tokens = quote((a..b:c) is Range)
    let expr = ParseExpr(input)
    if (expr.isIsExpr()) {
        var b = expr.asIsExpr()
        if (b.getExpr().asParenExpr().getExpr().asRangeExpr().getStartExpr().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        if (b.getType().asRefType().getIdentifier().value != "Range") {
            return 2
        }
        return 0
    }
    return 3
}
