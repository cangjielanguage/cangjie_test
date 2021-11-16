// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(#{a[b],b[0]})
    let expr = ParseExpr(input)
    if (expr.isSetOrMapLit()) {
        var b = expr.asSetOrMapLit()
        if (b.getElements()[0].asSubscriptExpr().getBaseExpr().asRefExpr().getIdentifier().value != "a"){
            return 1
        }
        if (b.getElements()[1].asSubscriptExpr().getIndexExpr().asLitConstExpr().getLiteral().value != "0"){
            return 3
        }
        return 0
    }
    return 5
}
