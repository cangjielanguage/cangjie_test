// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(())
    let expr = ParseExpr(input)
    if (expr.isParenExpr()) {
        return 1
    }
    return 0
}
