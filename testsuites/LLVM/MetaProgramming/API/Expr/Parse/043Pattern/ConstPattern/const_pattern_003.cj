// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         match (a) {
            case 10 | \$c | 30 | "hi" if (true) => b
         }
    )
    let expr = ParseExpr(input)
    if (expr.isMatchExpr()) {
        var mh = expr.asMatchExpr()
        var pattern = mh.getMatchCases()[0].getPattern()
        if (!pattern.isConstPattern()) {
            return 2
        }
        if (pattern.asConstPattern().getPatternTerms()[0].asLitConstExpr().getLiteral().value != "10") {
            return 3
        }
        if (pattern.asConstPattern().getPatternTerms()[1].asRefExpr().getIdentifier().value != "c") {
            return 4
        }
        if (pattern.asConstPattern().getPatternTerms()[2].asLitConstExpr().getLiteral().value != "30") {
            return 5
        }
        if (pattern.asConstPattern().getPatternTerms()[3].asLitConstExpr().getLiteral().value != "hi") {
            return 6
        }
        return 0
    }
    return 1
}
