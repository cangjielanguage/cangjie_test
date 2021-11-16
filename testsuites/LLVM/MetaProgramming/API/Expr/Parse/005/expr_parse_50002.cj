// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan BaseFunc in CallExpr must be RefExpr or MemberAccess.

from ast import ast.*

func main() {
   	var input : Tokens = quote(1())
    let expr = ParseExpr(input)
    //if (expr.isCallExpr()) {
    //    var b = expr.asCallExpr()
//
    //    return 0
    //}
    return 0
}
