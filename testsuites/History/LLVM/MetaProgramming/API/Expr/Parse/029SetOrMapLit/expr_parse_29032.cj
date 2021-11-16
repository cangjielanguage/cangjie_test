// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        #{(a):(b)}
    )
    let expr = ParseExpr(input)
    if (expr.isSetOrMapLit()) {
        var e = expr.asSetOrMapLit().getElements()[0].asMapMember()
        if (e.getKey().asParenExpr().getExpr().asRefExpr().getIdentifier().value != "a") {
            return 2
        }
        if (e.getValue().asParenExpr().getExpr().asRefExpr().getIdentifier().value != "b") {
            return 3
        }
        return 0
    }
    return 1
}
