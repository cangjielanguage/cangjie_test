// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        #{a[b]: c[d]}
    )
    let expr = ParseExpr(input)
    if (expr.isSetOrMapLit()) {
        var e = expr.asSetOrMapLit().getElements()[0].asMapMember()
        if (e.getKey().asSubscriptExpr().getBaseExpr().asRefExpr().getIdentifier().value != "a") {
            return 2
        }
        if (e.getValue().asSubscriptExpr().getIndexExpr().asRefExpr().getIdentifier().value != "d") {
            return 3
        }
        return 0
    }
    return 1
}
