// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         Array<T>(1,2)
    )
    let expr = ParseExpr(input)
    if (expr.isArrayExpr()) {
        var array = expr.asArrayExpr()
        if (!array.getType().isArrayType()) {
            return 2
        }
        if (array.getArgs()[0].asLitConstExpr().getLiteral().value != "1") {
            return 3
        }
        if (array.getArgs()[1].asLitConstExpr().getLiteral().value != "2") {
            return 4
        }
        return 0
    }
    return 1
}
