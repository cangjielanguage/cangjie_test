// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(a[..b][c[d..]])
    let expr = ParseExpr(input)
    if (expr.isSubscriptExpr()) {
        var b = expr.asSubscriptExpr()
        if (b.getBaseExpr().asSubscriptExpr().getBaseExpr().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        if (b.getIndexExpr().asSubscriptExpr().getIndexExpr().asRangeExpr().getStartExpr().asRefExpr().getIdentifier().value != "d") {
            return 3
        }
        if (b.isTupleAccess()) {
            return 4
        }
        return 0
    }
    return 5
}
