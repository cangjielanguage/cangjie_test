// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         match (a) {
            case (\$a, a, day(1) | Day(2,_), in [10, 40], _, (_, 1)) if (true) => b
         }
    )
    let expr = ParseExpr(input)
    if (expr.isMatchExpr()) {
        var mh = expr.asMatchExpr()
        var pattern = mh.getMatchCases()[0].getPattern()
        if (!pattern.isTuplePattern()) {
            return 2
        }
        if (pattern.asTuplePattern().getPatterns()[0].asConstPattern().getPatternTerms()[0].asRefExpr().getIdentifier().value != "a") {
            return 3
        }
        if (pattern.asTuplePattern().getPatterns()[1].asVarPattern().getVarDecl().getIdentifier().value != "a") {
            return 4
        }
        if (pattern.asTuplePattern().getPatterns()[2].asMultiEnumPattern().getPatternTerms()[0].getRef().asRefExpr().getIdentifier().value != "day") {
            return 5
        }
        if (pattern.asTuplePattern().getPatterns()[3].asInPattern().getInPattern().asListLit().getChildren()[0].asLitConstExpr().getLiteral().value != "10") {
            return 6
        }
        if (!pattern.asTuplePattern().getPatterns()[4].isWildcardPattern()) {
            return 7
        }
        if (!pattern.asTuplePattern().getPatterns()[5].asTuplePattern().getPatterns()[0].isWildcardPattern()) {
            return 8
        }
        return 0
    }
    return 1
}
