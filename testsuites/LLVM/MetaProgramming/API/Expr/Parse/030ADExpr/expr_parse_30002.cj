// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex Expr Not Supported in Libast Yet

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        adjointOf()
    )
    let expr = ParseExpr(input)
    if (!expr.isAdjointExpr()) {
        return 0
    }
    return 1
}
