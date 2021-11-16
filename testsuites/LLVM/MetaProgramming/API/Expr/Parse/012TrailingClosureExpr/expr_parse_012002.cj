// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(foo{=>1})
    let expr = ParseExpr(input)
    if (expr.isTrailingClosureExpr()) {
        var b = expr.asTrailingClosureExpr()
        if (b.getExpr().asRefExpr().getIdentifier().value != "foo"){
            return 1
        }
        if (b.getLambda().getLambdaBody()[0].asExpr().asLitConstExpr().getLiteral().value != "1"){
            return 2
        }
        return 0
    }
    return 4
}
