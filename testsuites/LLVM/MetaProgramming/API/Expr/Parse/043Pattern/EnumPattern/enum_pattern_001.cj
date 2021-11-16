// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         match (a) {
            case Day(1) if (true) => b
         }
    )
    let expr = ParseExpr(input)
    if (expr.isMatchExpr()) {
        var mh = expr.asMatchExpr()
        var pattern = mh.getMatchCases()[0].getPattern()
        if (!pattern.isEnumPattern()) {
            return 2
        }
        if (pattern.asEnumPattern().getRef().asRefExpr().getIdentifier().value != "Day") {
            return 3
        }
        if (pattern.asEnumPattern().getTuplePattern().asTuplePattern().getPatterns()[0].asConstPattern().getPatternTerms()[0].asLitConstExpr().getLiteral().value != "1") {
            return 4
        }
        return 0
    }
    return 1
}
