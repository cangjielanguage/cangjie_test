// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote((-b))
    let expr = ParseExpr(input)
    if (expr.isParenExpr()) {
        var b = expr.asParenExpr()
        if (b.getExpr().asUnaryExpr().getExpr().asRefExpr().getIdentifier().value != "b") {
            return 1
        }
        return 0
    }
    return 3
}
