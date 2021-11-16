// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input : Tokens = quote({123})
    let expr = ParseLambdaExpr(input)
    if (expr.getLambdaParams().size() != 0) {
        return 1
    }
    if (expr.getLambdaBody()[0].asExpr().asLitConstExpr().getLiteral().value != "123") {
        return 2
    }
    return 0

}
