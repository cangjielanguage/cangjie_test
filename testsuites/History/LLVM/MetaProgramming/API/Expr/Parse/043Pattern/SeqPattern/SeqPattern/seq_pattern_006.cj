// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         match (a) {
            case [a, b] if (true) => b
         }
    )
    let expr = ParseExpr(input)
    if (expr.isMatchExpr()) {
        var mh = expr.asMatchExpr()
        var pattern = mh.getMatchCases()[0].getPattern()
        pattern.toTokens().dump()
        if (!pattern.isSeqPattern()) {
            return 2
        }
        pattern.asSeqPattern().toTokens().dump()
        if (pattern.asSeqPattern().getPatterns()[0].asVarPattern().getVarDecl().getIdentifier().value != "a") {
            return 3
        }
        if (pattern.asSeqPattern().getPatterns()[1].asVarPattern().getVarDecl().getIdentifier().value != "b") {
            return 4
        }
        if (pattern.asSeqPattern().getRangeIndex() != Int32(-1)) {
            return 5
        }
        return 0
    }
    return 1
}
