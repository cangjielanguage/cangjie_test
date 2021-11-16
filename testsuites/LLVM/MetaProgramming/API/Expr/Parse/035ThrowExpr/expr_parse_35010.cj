// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(
         throw A.b<T>
    )
    let expr = ParseExpr(input)
    if (expr.isThrowExpr()) {
        var b = expr.asThrowExpr()
        if (b.getExpr().asMemberAccess().getBaseExpr().asRefExpr().getIdentifier().value != "A") {
            return 2
        }
        if (b.getExpr().asMemberAccess().getArgs()[0].asRefType().getIdentifier().value != "T") {
            return 3
        }
        return 0
    }
    return 1
}
