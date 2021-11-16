// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(a[b..][c])
    let expr = ParseExpr(input)
    if (expr.isSubscriptExpr()) {
        var b = expr.asSubscriptExpr ()
        if (b.getBaseExpr().asSubscriptExpr().getBaseExpr().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        if (b.getBaseExpr().asSubscriptExpr().getIndexExpr().asRangeExpr().getStartExpr().asRefExpr().getIdentifier().value != "b") {
            return 2
        }
        if (b.getIndexExpr().asRefExpr().getIdentifier().value != "c") {
            return 1
        }
        if (b.isTupleAccess()) {
            return 3
        }
        return 0
    }
    return 5
}
