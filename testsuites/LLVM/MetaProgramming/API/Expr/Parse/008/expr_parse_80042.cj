// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan [libast]: Argument is null

from ast import ast.*

func main() {
   	var input : Tokens = quote(a==b)
    let expr = ParseAssignExpr(input)
    return 0
}
