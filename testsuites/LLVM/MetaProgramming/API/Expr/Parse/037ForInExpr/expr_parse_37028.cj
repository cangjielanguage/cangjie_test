// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
        for (i in grad(square, 1.0)) if (grad(square, 1.0)){
            grad(square, 1.0)
        }
    )
    let expr = ParseExpr(input)
    if (expr.isForInExpr()) {
        var forExpr = expr.asForInExpr()
        if (forExpr.getPattern().asVarPattern().getVarDecl().getIdentifier().value != "i") {
            return 2
        }
        if (forExpr.getInExpr().asGradExpr().getDiffFuncExpr().asRefExpr().getIdentifier().value != "square") {
            return 3
        }
        if (!forExpr.hasPatternGuard()){
            return 5
        }
        if (forExpr.getPatternGuard().asGradExpr().getDiffFuncExpr().asRefExpr().getIdentifier().value != "square") {
            return 6
        }
        if (forExpr.getBody()[0].asExpr().asGradExpr().getDiffFuncExpr().asRefExpr().getIdentifier().value != "square") {
            return 7
        }
        return 0
    }
    return 1
}
