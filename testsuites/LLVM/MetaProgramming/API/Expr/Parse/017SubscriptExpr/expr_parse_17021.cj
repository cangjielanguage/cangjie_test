// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(\@{1,2}[1])
    let expr = ParseExpr(input)
    if (expr.isSubscriptExpr()) {
        var b = expr.asSubscriptExpr()
        if (b.getBaseExpr().asArrayLit().getChildren()[0].asLitConstExpr().getLiteral().value != "1") {
            return 1
        }
        if (b.getIndexExpr().asLitConstExpr().getLiteral().value != "1") {
            return 3
        }
        if (b.isTupleAccess()) {
            return 4
        }
        return 0
    }
    return 5
}
