// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(
        try {} catch(_: RunTime) {} finally {}
    )
    let expr = ParseExpr(input)
    if (expr.isTryExpr()) {
        var pattern = expr.asTryExpr().getCatchPatterns()[0]
        if (!pattern.isExceptTypePattern()) {
            return 2
        }
        if (!pattern.asExceptTypePattern().getPattern().isWildcardPattern()){
            return 3
        }
        if (pattern.asExceptTypePattern().getTypes()[0].asRefType().getIdentifier().value != "RunTime"){
            return 4
        }
        return 0
    }
    return 1
}
