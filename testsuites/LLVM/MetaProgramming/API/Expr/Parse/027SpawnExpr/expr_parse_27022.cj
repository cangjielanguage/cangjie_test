// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input : Tokens = quote(spawn{=> (1, 2, 3, 4)})
    let expr = ParseSpawnExpr(input)
    var b = expr.getTaskExpr().asLambdaExpr()
    if  (b.getLambdaBody()[0].asExpr().asTupleLit().getChildren()[1].asLitConstExpr().getLiteral().value != "2") {
        return 3
    }
    return 0

}
