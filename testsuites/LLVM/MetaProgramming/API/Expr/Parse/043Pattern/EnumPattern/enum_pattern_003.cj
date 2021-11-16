// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         match (a) {
            case Day(\$a, a, day(1) | Day(2,_), in [10, 40], _, (_, 1)) if (true) => b
         }
    )
    let expr = ParseExpr(input)
    if (expr.isMatchExpr()) {
        var mh = expr.asMatchExpr()
        var pattern1 = mh.getMatchCases()[0].getPattern()
        if (!pattern1.isEnumPattern()) {
            return 2
        }
        if (pattern1.asEnumPattern().getRef().asRefExpr().getIdentifier().value != "Day") {
            return 3
        }

        var pattern = pattern1.asEnumPattern().getTuplePattern()
        if (!pattern.isTuplePattern()) {
            return 4
        }
        if (pattern.asTuplePattern().getPatterns()[0].asConstPattern().getPatternTerms()[0].asRefExpr().getIdentifier().value != "a") {
            return 5
        }
        if (pattern.asTuplePattern().getPatterns()[1].asVarPattern().getVarDecl().getIdentifier().value != "a") {
            return 6
        }
        if (pattern.asTuplePattern().getPatterns()[2].asMultiEnumPattern().getPatternTerms()[0].getRef().asRefExpr().getIdentifier().value != "day") {
            return 7
        }
        if (pattern.asTuplePattern().getPatterns()[3].asInPattern().getInPattern().asListLit().getChildren()[0].asLitConstExpr().getLiteral().value != "10") {
            return 8
        }
        if (!pattern.asTuplePattern().getPatterns()[4].isWildcardPattern()) {
            return 9
        }
        if (!pattern.asTuplePattern().getPatterns()[5].asTuplePattern().getPatterns()[0].isWildcardPattern()) {
            return 10
        }
        return 0
    }
    return 1
}
