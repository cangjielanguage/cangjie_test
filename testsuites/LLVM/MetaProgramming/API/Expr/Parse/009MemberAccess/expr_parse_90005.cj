// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(a..b)
    let expr = ParseExpr(input)
    if (!expr.isMemberAccess()) {
        return 0
    }
    return 3
}
