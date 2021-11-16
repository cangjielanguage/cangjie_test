// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex BaseFunc in CallExpr must be RefExpr or MemberAccess

from ast import ast.*

func main() {
   	var input : Tokens = quote({}())
    let expr = ParseExpr(input)
    if (expr.isCallExpr()) {
        var b = expr.asCallExpr()
        if (b.getBaseFunc().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        return 0
    }
    return 3
}
