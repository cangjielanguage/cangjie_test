// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(a[0].b)
    let expr = ParseExpr(input)
    if (expr.isMemberAccess()) {
        var b = expr.asMemberAccess()
        if (b.getBaseExpr().asSubscriptExpr().getBaseExpr().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        if (b.getBaseExpr().asSubscriptExpr().getIndexExpr().asLitConstExpr().getLiteral().value != "0") {
            return 2
        }
        if (b.getField().value != "b") {
            return 3
        }
        return 0
    }
    return 4
}
