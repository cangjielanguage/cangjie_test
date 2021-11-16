// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         for (item in list) {}
    )
    let expr = ParseExpr(input)
    if (expr.isForInExpr()) {
        var forExpr = expr.asForInExpr()
        if (forExpr.getPattern().asVarPattern().getVarDecl().getIdentifier().value != "item") {
            return 2
        }
        if (forExpr.getInExpr().asRefExpr().getIdentifier().value != "list") {
            return 3
        }
        if (forExpr.hasPatternGuard()){
            return 4
        }
        if (forExpr.getBody().size() != 0) {
            return 5
        }
        return 0
    }
    return 1
}
