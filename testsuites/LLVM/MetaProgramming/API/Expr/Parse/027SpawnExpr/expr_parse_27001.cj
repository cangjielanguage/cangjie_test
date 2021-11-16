// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(spawn {a})
    let expr = ParseExpr(input)
    if (expr.isSpawnExpr()) {
        var b = expr.asSpawnExpr()
        if (b.getTaskExpr().asLambdaExpr().getLambdaBody()[0].asExpr().asRefExpr().getIdentifier().value != "a") {
            return 1
        }

        return 0
    }
    return 3
}
