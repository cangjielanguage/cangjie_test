// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
        for (i in do {b} while(d)) if (do {b} while(d)){
            do {b} while(d)
        }
    )
    let expr = ParseExpr(input)
    if (expr.isForInExpr()) {
        var forExpr = expr.asForInExpr()
        if (forExpr.getPattern().asVarPattern().getVarDecl().getIdentifier().value != "i") {
            return 2
        }
        if (forExpr.getInExpr().asDoWhileExpr().getBody()[0].asExpr().asRefExpr().getIdentifier().value != "b") {
            return 3
        }
        if (!forExpr.hasPatternGuard()){
            return 5
        }
        if (forExpr.getPatternGuard().asDoWhileExpr().getCondExpr().asRefExpr().getIdentifier().value != "d") {
            return 6
        }
        if (forExpr.getBody()[0].asExpr().asDoWhileExpr().getBody()[0].asExpr().asRefExpr().getIdentifier().value != "b") {
            return 7
        }
        return 0
    }
    return 1
}
