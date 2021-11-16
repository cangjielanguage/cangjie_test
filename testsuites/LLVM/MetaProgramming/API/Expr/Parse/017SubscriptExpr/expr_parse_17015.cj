// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(if (true) {a} else {b}[if (true) {a} else {b}])
    let expr = ParseExpr(input)
    if (expr.isSubscriptExpr()) {
        var b = expr.asSubscriptExpr()
        if (b.getBaseExpr().asIfExpr().getIfBody()[0].asExpr().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        if (b.getIndexExpr().asIfExpr().getElseBranch().asExpr().asBlock().getBody()[0].asExpr().asRefExpr().getIdentifier().value != "b") {
            return 3
        }
        if (b.isTupleAccess()) {
            return 4
        }
        return 0
    }
    return 5
}
