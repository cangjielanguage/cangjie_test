// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         Array<T>(size, expr)
    )
    let expr = ParseArrayExpr(input)
    if (expr.getType().isArrayType() != true) {
        return 2
    }
    if (expr.getArgs()[0].asRefExpr().getIdentifier().value != "size") {
        return 3
    }
    if (expr.getArgs()[1].asRefExpr().getIdentifier().value != "expr") {
        return 4
    }
    return 0
}
