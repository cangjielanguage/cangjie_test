// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         for (A(x) | B (_) in list) {}
    )
    let expr = ParseExpr(input)
    if (expr.isForInExpr()) {
        var forExpr = expr.asForInExpr()
        if (!forExpr.getPattern().isMultiEnumPattern()) {
            return 2
        }
        if (forExpr.getPattern().asMultiEnumPattern().getPatternTerms()[0].getRef().asRefExpr().getIdentifier().value != "A") {
            return 3
        }
        if (!forExpr.getPattern().asMultiEnumPattern().getPatternTerms()[1].getTuplePattern().asTuplePattern().getPatterns()[0].isWildcardPattern()) {
            return 4
        }
        if (forExpr.getInExpr().asRefExpr().getIdentifier().value != "list") {
            return 5
        }
        if (forExpr.hasPatternGuard()){
            return 6
        }
        if (forExpr.getBody().size() != 0) {
            return 7
        }
        return 0
    }
    return 1
}
