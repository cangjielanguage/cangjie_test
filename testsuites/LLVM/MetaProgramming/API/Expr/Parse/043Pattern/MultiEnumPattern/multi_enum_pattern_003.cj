// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         match (a) {
            case Day(\$a, a, day(1) | Day(2,_), in [10, 40], _, (_, 1)) | Hour(\$a, a, day(1) | Day(2,_), in [10, 40], _, (_, 1)) if (true) => b
         }
    )
    let expr = ParseExpr(input)
    if (expr.isMatchExpr()) {
        var mh = expr.asMatchExpr()
        var pattern = mh.getMatchCases()[0].getPattern()
        if (!pattern.isMultiEnumPattern()) {
            return 2
        }
        if (pattern.asMultiEnumPattern().getPatternTerms()[0].getRef().asRefExpr().getIdentifier().value != "Day") {
            return 3
        }
        if (pattern.asMultiEnumPattern().getPatternTerms()[1].getRef().asRefExpr().getIdentifier().value != "Hour") {
            return 4
        }

        var pattern1 = pattern.asMultiEnumPattern().getPatternTerms()[0].getTuplePattern()
        if (!pattern1.isTuplePattern()) {
            return 11
        }
        if (pattern1.asTuplePattern().getPatterns()[0].asConstPattern().getPatternTerms()[0].asRefExpr().getIdentifier().value != "a") {
            return 12
        }
        if (pattern1.asTuplePattern().getPatterns()[1].asVarPattern().getVarDecl().getIdentifier().value != "a") {
            return 13
        }
        if (pattern1.asTuplePattern().getPatterns()[2].asMultiEnumPattern().getPatternTerms()[0].getRef().asRefExpr().getIdentifier().value != "day") {
            return 14
        }
        if (pattern1.asTuplePattern().getPatterns()[3].asInPattern().getInPattern().asListLit().getChildren()[0].asLitConstExpr().getLiteral().value != "10") {
            return 15
        }
        if (!pattern1.asTuplePattern().getPatterns()[4].isWildcardPattern()) {
            return 16
        }
        if (!pattern1.asTuplePattern().getPatterns()[5].asTuplePattern().getPatterns()[0].isWildcardPattern()) {
            return 17
        }

        var pattern2 = pattern.asMultiEnumPattern().getPatternTerms()[1].getTuplePattern()
        if (!pattern2.isTuplePattern()) {
            return 21
        }
        if (pattern2.asTuplePattern().getPatterns()[0].asConstPattern().getPatternTerms()[0].asRefExpr().getIdentifier().value != "a") {
            return 22
        }
        if (pattern2.asTuplePattern().getPatterns()[1].asVarPattern().getVarDecl().getIdentifier().value != "a") {
            return 23
        }
        if (pattern2.asTuplePattern().getPatterns()[2].asMultiEnumPattern().getPatternTerms()[0].getRef().asRefExpr().getIdentifier().value != "day") {
            return 24
        }
        if (pattern2.asTuplePattern().getPatterns()[3].asInPattern().getInPattern().asListLit().getChildren()[0].asLitConstExpr().getLiteral().value != "10") {
            return 25
        }
        if (!pattern2.asTuplePattern().getPatterns()[4].isWildcardPattern()) {
            return 26
        }
        if (!pattern2.asTuplePattern().getPatterns()[5].asTuplePattern().getPatterns()[0].isWildcardPattern()) {
            return 27
        }
        return 0
    }
    return 1
}
