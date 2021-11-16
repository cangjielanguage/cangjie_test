// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         Array<T>(try {} catch(_) {} finally {}, try {} catch(_) {} finally {})
    )
    let expr = ParseExpr(input)
    if (expr.isArrayExpr()) {
        var array = expr.asArrayExpr()
        if (!array.getType().isArrayType()) {
            return 2
        }
        if (!array.getArgs()[0].asTryExpr().getCatchPatterns()[0].isWildcardPattern()) {
            return 3
        }
        if (!array.getArgs()[1].asTryExpr().getCatchPatterns()[0].isWildcardPattern()){
            return 4
        }
        return 0
    }
    return 1
}
