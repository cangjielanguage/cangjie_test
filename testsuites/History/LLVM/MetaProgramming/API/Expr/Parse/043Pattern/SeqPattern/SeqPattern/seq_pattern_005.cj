// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         match (a) {
            case [] if (true) => b
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
        if (pattern.asSeqPattern().getPatterns().size() != 0) {
            return 3
        }
        if (pattern.asSeqPattern().getRangeIndex() != Int32(-1)) {
            return 4
        }

        return 0
    }
    return 1
}
