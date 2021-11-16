// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input : Tokens = quote({a:Int32=>b})
    let expr = ParseExpr(input)
    if (expr.isLambdaExpr()) {
        var b = expr.asLambdaExpr()
        if (b.getLambdaParams()[0].getIdentifier().value != "a") {
            return 1
        }
        if (b.getLambdaParams()[0].getType().asPrimitiveType().getPrimitive().value != "Int32") {
            return 2
        }
        if (b.getLambdaBody()[0].asExpr().asRefExpr().getIdentifier().value != "b") {
            return 3
        }
        return 0
    }
    return 10
}
