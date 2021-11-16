// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         Array<T>(size, expr)
    )
    let expr = ParseExpr(input)
    if (expr.isArrayExpr()) {
        var array = expr.asArrayExpr()
        if (array.getType().isArrayType() != true) {
            return 2
        }
        if (array.getArgs()[0].asRefExpr().getIdentifier().value != "size") {
            return 3
        }
        if (array.getArgs()[1].asRefExpr().getIdentifier().value != "expr") {
            return 4
        }
        return 0
    }
    return 1
}
