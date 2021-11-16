// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(a<T>)
    let expr = ParseExpr(input)
    if (expr.isRefExpr()) {
        var b = expr.asRefExpr()
        if (b.getIdentifier().value != "a") {
            return 1
        }
        return 0
    }
    return 3
}
