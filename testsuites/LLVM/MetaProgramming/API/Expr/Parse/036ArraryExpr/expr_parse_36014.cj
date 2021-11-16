// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         Array<T>(A.b<T>, C.d<V>)
    )
    let expr = ParseExpr(input)
    if (expr.isArrayExpr()) {
        var array = expr.asArrayExpr()
        if (!array.getType().isArrayType()) {
            return 2
        }
        if (array.getArgs()[0].asMemberAccess().getBaseExpr().asRefExpr().getIdentifier().value != "A") {
            return 3
        }
        if (array.getArgs()[1].asMemberAccess().getBaseExpr().asRefExpr().getIdentifier().value != "C"){
            return 4
        }
        return 0
    }
    return 1
}
