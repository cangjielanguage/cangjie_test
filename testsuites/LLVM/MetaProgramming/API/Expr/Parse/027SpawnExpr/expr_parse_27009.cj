// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input : Tokens = quote(spawn{123})
    let expr = ParseSpawnExpr(input)
    var b = expr.getTaskExpr().asLambdaExpr()
    if (b.getLambdaParams().size() != 0) {
        return 1
    }
    if (b.getLambdaBody()[0].asExpr().asLitConstExpr().getLiteral().value != "123") {
        return 2
    }
    return 0

}
