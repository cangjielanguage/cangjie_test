// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         match (a) {
            case in a if (true) => b
         }
    )
    let expr = ParseExpr(input)
    if (expr.isMatchExpr()) {
        var mh = expr.asMatchExpr()
        mh.toTokens().dump()
        var pattern = mh.getMatchCases()[0].getPattern()
        if (!pattern.isInPattern()) {
            return 2
        }
        if (pattern.asInPattern().getInPattern().asRefExpr().getIdentifier().value != "a") {
            return 3
        }
        return 0
    }
    return 1
}
