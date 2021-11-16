// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(foo(){=>1})
    let expr = ParseTrailingClosureExpr(input)
    if (expr.getExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "foo"){
        return 1
    }
    if (expr.getLambda().getLambdaBody()[0].asExpr().asLitConstExpr().getLiteral().value != "1"){
        return 2
    }
    return 0
}
