// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input: Tokens = quote([*[b,c]])
    let expr = ParseExpr(input)
    var b = expr.asListLit().getChildren()[0]
    if (b.isListSpreadExpr()) {
        var c = b.asListSpreadExpr()
        if (c.getChild().asListLit().getChildren()[0].asRefExpr().getIdentifier().value != "b"){
            return 3
        }
        return 0
    }
    return 4
}
