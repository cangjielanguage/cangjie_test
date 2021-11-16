// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input : Tokens = quote(spawn{=>b})
    let expr = ParseSpawnExpr(input)
    var b = expr.getTaskExpr().asLambdaExpr()
    if (b.getLambdaBody()[0].asExpr().asRefExpr().getIdentifier().value != "b") {
        return 3
    }
    return 0

}
