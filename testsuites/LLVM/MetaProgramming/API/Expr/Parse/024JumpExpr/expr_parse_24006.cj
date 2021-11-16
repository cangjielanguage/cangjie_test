// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(return)
    let expr = ParseExpr(input)
    if (!expr.isJumpExpr()) {
        return 0
    }
    return 1
}
