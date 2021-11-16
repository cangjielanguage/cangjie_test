// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         match (a) {
            case a: A => b
         }
    )
    let expr = ParseExpr(input)
    if (expr.isMatchExpr()) {
        var mh = expr.asMatchExpr()
        var pattern = mh.getMatchCases()[0].getPattern()
        if (!pattern.isTypePattern()) {
            return 6
        }
        if (pattern.asTypePattern().getPattern().asVarPattern().getVarDecl().getIdentifier().value != "a") {
            return 7
        }
        var tp = pattern.asTypePattern().getType()
        if (tp.asRefType().getIdentifier().value != "A") {
            return 3
        }
        return 0
    }
    return 1
}
