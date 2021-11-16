// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(
         throw a is B
    )
    let expr = ParseExpr(input)
    if (expr.isThrowExpr()) {
        var b = expr.asThrowExpr()
        if (b.getExpr().asIsExpr().getExpr().asRefExpr().getIdentifier().value != "a") {
            return 2
        }
        return 0
    }
    return 1
}
