// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote([return a,return b, *return c])
    let expr = ParseExpr(input)
    if (expr.isListLit()) {
        var b = expr.asListLit()
        if (b.getChildren()[0].asReturnExpr().getExpr().asRefExpr().getIdentifier().value != "a"){
            return 1
        }
        if (b.getChildren()[1].asReturnExpr().getExpr().asRefExpr().getIdentifier().value != "b"){
            return 3
        }
        if (b.getChildren()[2].asListSpreadExpr().getChild().asReturnExpr().getExpr().asRefExpr().getIdentifier().value != "c"){
            return 4
        }
        return 0
    }
    return 5
}
