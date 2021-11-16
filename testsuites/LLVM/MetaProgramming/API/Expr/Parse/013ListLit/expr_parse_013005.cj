// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote([a,1,*[b,c]])
    let expr = ParseExpr(input)
    if (expr.isListLit()) {
        var b = expr.asListLit()
        if (b.getChildren()[0].asRefExpr().getIdentifier().value != "a"){
            return 1
        }
        if (b.getChildren()[1].asLitConstExpr().getLiteral().value != "1"){
            return 2
        }
        if (b.getChildren()[2].asListSpreadExpr().getChild().asListLit().getChildren()[0].asRefExpr().getIdentifier().value != "b"){
            return 3
        }
        return 0
    }
    return 4
}
