// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(break)
    let expr = ParseExpr(input)
    if (expr.isJumpExpr()) {
        var b = expr.asJumpExpr()
        if (!b.isBreak()) {
            return 1
        }
        return 0
    }
    return 3
}
