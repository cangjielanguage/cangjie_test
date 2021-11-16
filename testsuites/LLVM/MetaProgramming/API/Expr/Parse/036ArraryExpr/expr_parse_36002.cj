// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         Array<T>(expr1, expr2, expr3, expr4)
    )
    let expr = ParseExpr(input)
    if (expr.isArrayExpr()) {
        var array = expr.asArrayExpr()
        if (array.getType().isArrayType() != true) {
            return 2
        }
        if (array.getArgs()[0].asRefExpr().getIdentifier().value != "expr1") {
            return 3
        }
        if (array.getArgs()[1].asRefExpr().getIdentifier().value != "expr2") {
            return 4
        }
        if (array.getArgs()[2].asRefExpr().getIdentifier().value != "expr3") {
            return 5
        }
        if (array.getArgs()[3].asRefExpr().getIdentifier().value != "expr4") {
            return 5
        }
        return 0
    }
    return 1
}
