// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote([a.b,c.d, *e.c])
    let expr = ParseExpr(input)
    if (expr.isListLit()) {
        var b = expr.asListLit()
        if (b.getChildren()[0].asMemberAccess().getBaseExpr().asRefExpr().getIdentifier().value != "a"){
            return 1
        }
        if (b.getChildren()[1].asMemberAccess().getField().value != "d"){
            return 3
        }
        if (b.getChildren()[2].asListSpreadExpr().getChild().asMemberAccess().getField().value != "c"){
            return 4
        }
        return 0
    }
    return 5
}
