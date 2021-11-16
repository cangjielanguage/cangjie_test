// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(while (foo(){a:Int32=>b}){ bar(){c:Int32 => d} })
    let expr = ParseExpr(input)
    if (expr.isWhileExpr()) {
        var b = expr.asWhileExpr()
        if (b.getCondExpr().asTrailingClosureExpr().getExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "foo") {
            return 1
        }
        if (b.getBody()[0].asExpr().asTrailingClosureExpr().getLambda().getLambdaBody()[0].asExpr().asRefExpr().getIdentifier().value != "d") {
            return 3
        }
        return 0
    }
    return 10
}
