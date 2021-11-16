// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(foo(1){=>a}.b)
    let expr = ParseExpr(input)
    if (expr.isMemberAccess()) {
        var b = expr.asMemberAccess()
        if (b.getBaseExpr().asTrailingClosureExpr().getLambda().getLambdaBody()[0].asExpr().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        if (b.getBaseExpr().asTrailingClosureExpr().getExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "foo") {
            return 2
        }
        if (b.getField().value != "b") {
            return 3
        }
        return 0
    }
    return 4
}
