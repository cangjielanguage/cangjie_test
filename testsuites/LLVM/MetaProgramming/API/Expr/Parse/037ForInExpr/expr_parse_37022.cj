// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
        for (i in match(a){case _=> a}) if (match(a){case _=>b}){
            match(a){case _=>c}
        }
    )
    let expr = ParseExpr(input)
    if (expr.isForInExpr()) {
        var forExpr = expr.asForInExpr()
        if (forExpr.getPattern().asVarPattern().getVarDecl().getIdentifier().value != "i") {
            return 2
        }
        if (!forExpr.getInExpr().asMatchExpr().getMatchMode()) {
            return 3
        }
        if (!forExpr.hasPatternGuard()){
            return 5
        }
        if (!forExpr.getPatternGuard().asMatchExpr().getMatchMode()) {
            return 6
        }
        if (!forExpr.getBody()[0].asExpr().asMatchExpr().getMatchMode()) {
            return 7
        }
        return 0
    }
    return 1
}
