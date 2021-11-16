// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        #{1:"a",2:"b",3:"c"}
    )
    let expr = ParseExpr(input)
    if (expr.isSetOrMapLit()) {
        var e1 = expr.asSetOrMapLit().getElements()[0].asMapMember()
        if (e1.getKey().asLitConstExpr().getLiteral().value != "1") {
            return 2
        }
        if (e1.getValue().asLitConstExpr().getLiteral().value != "a") {
            return 3
        }
        var e2 = expr.asSetOrMapLit().getElements()[1].asMapMember()
        if (e2.getKey().asLitConstExpr().getLiteral().value != "2") {
            return 4
        }
        var e3 = expr.asSetOrMapLit().getElements()[2].asMapMember()
        if (e3.getKey().asLitConstExpr().getLiteral().value != "3") {
            return 5
        }
        return 0
    }
    return 1
}
