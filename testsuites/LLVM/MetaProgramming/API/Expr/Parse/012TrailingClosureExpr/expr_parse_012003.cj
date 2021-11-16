// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(foo{})
    let expr = ParseExpr(input)
    if (expr.isTrailingClosureExpr()) {
        var b = expr.asTrailingClosureExpr()
        if (b.getExpr().asRefExpr().getIdentifier().value != "foo"){
            return 1
        }
        if (b.getLambda().getLambdaBody().size() != 0){
            return 2
        }
        return 0
    }
    return 4
}
