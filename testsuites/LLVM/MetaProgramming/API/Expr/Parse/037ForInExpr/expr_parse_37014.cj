// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
        for (i in a()) if (b(2)){
            c(x:y)
        }
    )
    let expr = ParseExpr(input)
    if (expr.isForInExpr()) {
        var forExpr = expr.asForInExpr()
        if (forExpr.getPattern().asVarPattern().getVarDecl().getIdentifier().value != "i") {
            return 2
        }
        if (forExpr.getInExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "a") {
            return 3
        }
        if (!forExpr.hasPatternGuard()){
            return 5
        }
        if (forExpr.getPatternGuard().asCallExpr().getArgs()[0].getExpr().asLitConstExpr().getLiteral().value != "2") {
            return 6
        }
        if (forExpr.getBody()[0].asExpr().asCallExpr().getArgs()[0].getName().value != "x") {
            return 7
        }
        return 0
    }
    return 1
}
