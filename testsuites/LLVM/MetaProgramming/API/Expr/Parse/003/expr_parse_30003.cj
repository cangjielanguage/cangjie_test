// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(!a())
    let expr = ParseExpr(input)
    if (expr.isUnaryExpr()) {
        var b = expr.asUnaryExpr()
        if (b.getExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        return 0
    }
    return 3
}
