// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         match (a) {
            case !in [1,2] if (true) => b
         }
    )
    input.toTokens().dump()
    let expr = ParseExpr(input)
    expr.toTokens().dump()
    if (expr.isMatchExpr()) {
        var mh = expr.asMatchExpr()
        var pattern = mh.getMatchCases()[0].getPattern()
        if (!pattern.isInPattern()) {
            return 2
        }
        if (pattern.asInPattern().getInPattern().asListLit().getChildren()[0].asLitConstExpr().getLiteral().value != "1") {
            return 3
        }
        return 0
    }
    return 1
}
