// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         Array<T>({ x:Int32 => 2 }, { y:Int32 => 4 })
    )
    let expr = ParseExpr(input)
    if (expr.isArrayExpr()) {
        var array = expr.asArrayExpr()
        if (!array.getType().isArrayType()) {
            return 2
        }
        if (array.getArgs()[0].asLambdaExpr().getLambdaParams()[0].getIdentifier().value != "x") {
            return 3
        }
        if (array.getArgs()[1].asLambdaExpr().getLambdaParams()[0].getIdentifier().value != "y"){
            return 4
        }
        return 0
    }
    return 1
}
