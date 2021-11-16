// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input : Tokens = quote(spawn{=>a+b;-b})
    let expr = ParseSpawnExpr(input)
    var b = expr.getTaskExpr().asLambdaExpr()
    if (b.getLambdaBody()[0].asExpr().asBinaryExpr().getLeftExpr().asRefExpr().getIdentifier().value != "a") {
        return 3
    }
    if (b.getLambdaBody()[1].asExpr().asUnaryExpr().getExpr().asRefExpr().getIdentifier().value != "b") {
        return 3
    }
    return 0

}
