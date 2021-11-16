// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(
         throw try {} catch(_) {} finally {}
    )
    let expr = ParseExpr(input)
    if (expr.isThrowExpr()) {
        var b = expr.asThrowExpr()
        if (!b.getExpr().asTryExpr().getCatchPatterns()[0].isWildcardPattern()) {
            return 2
        }
        return 0
    }
    return 1
}
