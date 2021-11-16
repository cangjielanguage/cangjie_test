// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         match (a) {
            case 10 if (true) => b;c;d;e;
         }
    )
    let expr = ParseExpr(input)
    if (expr.isMatchExpr()) {
        var mh = expr.asMatchExpr()
        if (!mh.getMatchMode()) {
            return 2
        }
        if (mh.getSelector().asRefExpr().getIdentifier().value != "a") {
            return 3
        }
        if (mh.getMatchCaseOthers().size() != 0) {
            return 4
        }
        if (mh.getMatchCases().size() == 0) {
            return 5
        }
        if (!mh.getMatchCases()[0].getPattern().isConstPattern()) {
            return 6
        }
        if (mh.getMatchCases()[0].getPattern().asConstPattern().getPatternTerms()[0].asLitConstExpr().getLiteral().value != "10") {
            return 7
        }
        if (!mh.getMatchCases()[0].hasPatternGuard()) {
            return 8
        }
        if (mh.getMatchCases()[0].getPatternGuard().asLitConstExpr().getLiteral().value != "true") {
            return 9
        }
        if (mh.getMatchCases()[0].getExprOrdecls()[3].asExpr().asRefExpr().getIdentifier().value != "e") {
            return 10
        }

        return 0
    }
    return 1
}
