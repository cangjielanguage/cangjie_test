// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1| compare %f
// ASSERT:scan IllegalArgumentException Argument is null

from ast import ast.*

func main() {
   	var input : Tokens = quote(1)
    let expr = ParseExpr(input)
    var b = expr.asBinaryExpr()

    return 0
 }
