// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(({123}, {a => b}))
    let expr = ParseExpr(input)
    if (expr.isTupleLit()) {
        var b = expr.asTupleLit()
        if (b.getChildren()[0].asLambdaExpr().getLambdaBody()[0].asExpr().asLitConstExpr().getLiteral().value != "123"){
            return 1
        }
        if (b.getChildren()[1].asLambdaExpr().getLambdaBody()[0].asExpr().asRefExpr().getIdentifier().value != "b"){
            return 3
        }
        return 0
    }
    return 5
}
