// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
        for (i in (A)) if ((B)){
            (C)
        }
    )
    let expr = ParseExpr(input)
    if (expr.isForInExpr()) {
        var forExpr = expr.asForInExpr()
        if (forExpr.getPattern().asVarPattern().getVarDecl().getIdentifier().value != "i") {
            return 2
        }
        if (forExpr.getInExpr().asParenExpr().getExpr().asRefExpr().getIdentifier().value != "A") {
            return 3
        }
        if (!forExpr.hasPatternGuard()){
            return 5
        }
        if (forExpr.getPatternGuard().asParenExpr().getExpr().asRefExpr().getIdentifier().value!= "B") {
            return 6
        }
        if (forExpr.getBody()[0].asExpr().asParenExpr().getExpr().asRefExpr().getIdentifier().value != "C") {
            return 7
        }
        return 0
    }
    return 1
}
