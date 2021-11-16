// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(while (true){})
    let expr = ParseExpr(input)
    if (!expr.isDoWhileExpr()) {
        return 0
    }
    return 3
}
