// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(a?().2=1)
    let expr = ParseExpr(input)
    if (!expr.isAssignExpr()) {
        return 0
    }
    return 3
}
