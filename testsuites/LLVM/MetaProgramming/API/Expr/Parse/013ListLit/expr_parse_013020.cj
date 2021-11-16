// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote([a[b],b[0], *c[0]])
    let expr = ParseExpr(input)
    if (expr.isListLit()) {
        var b = expr.asListLit()
        if (b.getChildren()[0].asSubscriptExpr().getBaseExpr().asRefExpr().getIdentifier().value != "a"){
            return 1
        }
        if (b.getChildren()[1].asSubscriptExpr().getIndexExpr().asLitConstExpr().getLiteral().value != "0"){
            return 3
        }
        if (b.getChildren()[2].asListSpreadExpr().getChild().asSubscriptExpr().getIndexExpr().asLitConstExpr().getLiteral().value != "0"){
            return 4
        }
        return 0
    }
    return 5
}
