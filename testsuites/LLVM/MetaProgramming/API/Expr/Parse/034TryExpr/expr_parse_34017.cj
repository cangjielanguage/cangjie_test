// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(
        try {
            { x:Int32 => 2 }
            a(){3}
            spawn {x}
        } catch(e: RunTime) {
            { x:Int32 => 2 }
            a(){3}
            spawn {x}
        } finally {
            { x:Int32 => 2 }
            a(){3}
            spawn {x}
        }
    )
    let expr = ParseExpr(input)
    if (expr.isTryExpr()) {
        var b = expr.asTryExpr()
        if (b.getTryBlock().getBody()[0].asExpr().asLambdaExpr().getLambdaParams()[0].getIdentifier().value != "x") {
            return 2
        }
        if (!b.getCatchPatterns()[0].isExceptTypePattern()){
            return 3
        }
        if (b.getCatchPatterns()[0].asExceptTypePattern().getTypes()[0].asRefType().getIdentifier().value != "RunTime"){
            return 4
        }
        if (b.getCatchBlocks()[0].getBody()[1].asExpr().asTrailingClosureExpr().getExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "a") {
            return 5
        }
        if (!b.hasFinallyBlock()){
            return 6
        }
        if (b.getFinallyBlock().getBody()[2].asExpr().asSpawnExpr().getTaskExpr().asLambdaExpr().getLambdaBody()[0].asExpr().asRefExpr().getIdentifier().value != "x") {
            return 7
        }
        return 0
    }
    return 1
}
