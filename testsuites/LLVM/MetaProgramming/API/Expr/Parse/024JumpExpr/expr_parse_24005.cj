// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(return)
    try {
        let expr = ParseJumpExpr(input)
    } catch (e: IllegalArgumentException) {
        return 0
    }
    return 1
}
