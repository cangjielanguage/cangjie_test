// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(a.b)
    let expr = ParseMemberAccess(input)
    if (expr.getBaseExpr().asRefExpr().getIdentifier().value != "a") {
        return 1
    }
    if (expr.getField().value != "b") {
        return 2
    }
    return 0
}
