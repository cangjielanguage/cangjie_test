// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
        for (i in for (x in items) {}) if (for (x in items) {}){
            for (x in items) {}
        }
    )
    let expr = ParseExpr(input)
    if (expr.isForInExpr()) {
        var forExpr = expr.asForInExpr()
        if (forExpr.getPattern().asVarPattern().getVarDecl().getIdentifier().value != "i") {
            return 2
        }
        if (forExpr.getInExpr().asForInExpr().hasPatternGuard()) {
            return 3
        }
        if (!forExpr.hasPatternGuard()){
            return 5
        }
        if (forExpr.getPatternGuard().asForInExpr().getPattern().asVarPattern().getVarDecl().getIdentifier().value != "x") {
            return 6
        }
        if (forExpr.getBody()[0].asExpr().asForInExpr().getInExpr().asRefExpr().getIdentifier().value != "items") {
            return 7
        }
        return 0
    }
    return 1
}
