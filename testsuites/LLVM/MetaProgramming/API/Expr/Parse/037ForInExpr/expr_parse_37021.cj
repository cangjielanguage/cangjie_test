// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
        for (i in while (a) {c}) if (while (a) {c}){
           while (a) {c}
        }
    )
    let expr = ParseExpr(input)
    if (expr.isForInExpr()) {
        var forExpr = expr.asForInExpr()
        if (forExpr.getPattern().asVarPattern().getVarDecl().getIdentifier().value != "i") {
            return 2
        }
        if (forExpr.getInExpr().asWhileExpr().getCondExpr().asRefExpr().getIdentifier().value != "a") {
            return 3
        }
        if (!forExpr.hasPatternGuard()){
            return 5
        }
        if (forExpr.getPatternGuard().asWhileExpr().getBody()[0].asExpr().asRefExpr().getIdentifier().value != "c") {
            return 6
        }
        if (forExpr.getBody()[0].asExpr().asWhileExpr().getCondExpr().asRefExpr().getIdentifier().value != "a") {
            return 7
        }
        return 0
    }
    return 1
}
