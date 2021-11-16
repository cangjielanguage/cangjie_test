// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        synchronized(mtx) {
            { x:Int32 => 2 }
            a(){3}
            spawn {x}
        }
    )
    let expr = ParseExpr(input)
    if (expr.isSynchronizedExpr()) {
        var b = expr.asSynchronizedExpr()
        if (b.getMutexExpr().asRefExpr().getIdentifier().value != "mtx") {
            return 1
        }
        if (b.getBody()[0].asExpr().asLambdaExpr().getLambdaParams()[0].getIdentifier().value != "x" ) {
            return 2
        }
        if (b.getBody()[1].asExpr().asTrailingClosureExpr().getExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "a") {
            return 3
        }
        if (b.getBody()[2].asExpr().asSpawnExpr().getTaskExpr().asLambdaExpr().getLambdaBody()[0].asExpr().asRefExpr().getIdentifier().value != "x") {
            return 3
        }
        return 0
    }
    return 5
}
