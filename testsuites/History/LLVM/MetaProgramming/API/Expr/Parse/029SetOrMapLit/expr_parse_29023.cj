// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        #{1:"a"}
    )
    let expr = ParseExpr(input)
    if (expr.isSetOrMapLit()) {
        var e = expr.asSetOrMapLit().getElements()[0].asMapMember()
        if (e.getKey().asLitConstExpr().getLiteral().value != "1") {
            return 2
        }
        if (e.getValue().asLitConstExpr().getLiteral().value != "a") {
            return 3
        }
        return 0
    }
    return 1
}
