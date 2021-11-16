// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote((a(){123}, b(){a => b}))
    let expr = ParseExpr(input)
    if (expr.isTupleLit()) {
        var b = expr.asTupleLit()
        if (b.getChildren()[0].asTrailingClosureExpr().getExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "a"){
            return 1
        }
        if (b.getChildren()[1].asTrailingClosureExpr().getLambda().getLambdaBody()[0].asExpr().asRefExpr().getIdentifier().value != "b"){
            return 3
        }
        return 0
    }
    return 5
}
