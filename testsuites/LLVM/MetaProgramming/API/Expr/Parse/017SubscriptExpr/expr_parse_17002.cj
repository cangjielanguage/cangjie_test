// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(a[..])
    let expr = ParseSubscriptExpr(input)
    if (expr.getBaseExpr().asRefExpr().getIdentifier().value != "a") {
        return 1
    }
    if (expr.getIndexExpr().asRangeExpr().isClosed()) {
        return 2
    }
    if (expr.isTupleAccess()) {
        return 3
    }
    return 0

}
