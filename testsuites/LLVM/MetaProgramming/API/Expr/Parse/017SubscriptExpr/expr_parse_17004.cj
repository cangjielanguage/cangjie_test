// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(a[..b])
    let expr = ParseExpr(input)
    if (expr.isSubscriptExpr()) {
        var b = expr.asSubscriptExpr ()
        if (b.getBaseExpr().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        if (b.getIndexExpr().asRangeExpr().getStopExpr().asRefExpr().getIdentifier().value != "b") {
            return 2
        }
        if (b.isTupleAccess()) {
            return 3
        }
        return 0
    }
    return 5
}
