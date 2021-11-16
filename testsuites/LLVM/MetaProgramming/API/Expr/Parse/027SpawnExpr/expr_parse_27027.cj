// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input : Tokens = quote(spawn{=> spawn{=>2} })
    let expr = ParseSpawnExpr(input)
    var b = expr.getTaskExpr().asLambdaExpr().getLambdaBody()[0].asExpr().asSpawnExpr().getTaskExpr().asLambdaExpr()
    if  (b.getLambdaBody()[0].asExpr().asLitConstExpr().getLiteral().value != "2") {
        return 3
    }
    return 0

}
