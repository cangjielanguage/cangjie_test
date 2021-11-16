// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan [libast]: Parsing Error in ParseExpr

from ast import ast.*

func main() {
   	var input : Tokens = quote((var a = 1))
    let expr = ParseExpr(input)
    if (expr.isParenExpr()) {
        return 1
    }
    return 0
}
