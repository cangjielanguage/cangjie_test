// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote((if (a){b}))
    let expr = ParseExpr(input)
    if (expr.isParenExpr()) {
        var b = expr.asParenExpr()
        if (b.getExpr().asIfExpr().getCondExpr().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        if (b.getExpr().asIfExpr().getIfBody()[0].asExpr().asRefExpr().getIdentifier().value != "b") {
            return 2
        }
        return 0
    }
    return 3
}
