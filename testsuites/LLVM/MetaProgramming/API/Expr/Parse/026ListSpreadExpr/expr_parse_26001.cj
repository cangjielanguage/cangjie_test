// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote([*list])
    let expr = ParseExpr(input)
    var b = expr.asListLit().getChildren()[0]
    if (b.isListSpreadExpr()) {
        var c = b.asListSpreadExpr()
        if (c.getChild().asRefExpr().getIdentifier().value != "list") {
            return 2
        }
        return 0
    }
    return 3
}
