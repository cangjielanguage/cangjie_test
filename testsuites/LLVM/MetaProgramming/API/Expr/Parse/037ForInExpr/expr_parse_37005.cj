// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         for ((x, y) in list) if (c) {}
    )
    let expr = ParseExpr(input)
    if (expr.isForInExpr()) {
        var forExpr = expr.asForInExpr()
        if (!forExpr.getPattern().isTuplePattern()) {
            return 2
        }
        if (forExpr.getPattern().asTuplePattern().getPatterns()[0].asVarPattern().getVarDecl().getIdentifier().value != "x") {
            return 3
        }
        if (forExpr.getPattern().asTuplePattern().getPatterns()[1].asVarPattern().getVarDecl().getIdentifier().value != "y") {
            return 4
        }
        if (forExpr.getInExpr().asRefExpr().getIdentifier().value != "list") {
            return 5
        }
        if (!forExpr.hasPatternGuard()){
            return 6
        }
        if (forExpr.getPatternGuard().asRefExpr().getIdentifier().value != "c") {
            return 7
        }
        if (forExpr.getBody().size() != 0) {
            return 8
        }

        return 0
    }
    return 1
}
