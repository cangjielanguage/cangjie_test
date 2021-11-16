// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex Expr Not Supported in Libast Yet

from ast import ast.*

func main() {
    var input: Tokens = quote(
         throw
    )
    let expr = ParseThrowExpr(input)
    return 0
}
