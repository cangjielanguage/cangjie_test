// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         Array<T>(return a, return b)
    )
    let expr = ParseExpr(input)
    if (expr.isArrayExpr()) {
        var array = expr.asArrayExpr()
        if (!array.getType().isArrayType()) {
            return 2
        }
        if (array.getArgs()[0].asReturnExpr().getExpr().asRefExpr().getIdentifier().value != "a") {
            return 3
        }
        if (array.getArgs()[1].asReturnExpr().getExpr().asRefExpr().getIdentifier().value != "b"){
            return 4
        }
        return 0
    }
    return 1
}
