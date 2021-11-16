// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        #{a.b : c.d}
    )
    let expr = ParseExpr(input)
    if (expr.isSetOrMapLit()) {
        var e = expr.asSetOrMapLit().getElements()[0].asMapMember()
        if (e.getKey().asMemberAccess().getBaseExpr().asRefExpr().getIdentifier().value != "a") {
            return 2
        }
        if (e.getValue().asMemberAccess().getField().value != "d") {
            return 3
        }
        return 0
    }
    return 1
}
