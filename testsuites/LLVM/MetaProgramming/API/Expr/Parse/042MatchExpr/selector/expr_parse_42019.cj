// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         match (grad(square, 1.0)) {
            case 10 if (true) => grad(square, 1.0)
            case 10 if (true) => (1,2,3)
            case 10 if (true) => try {} catch(_) {} finally {}
            case 10 if (true) => throw RunTime()
         }
    )
    let expr = ParseExpr(input)
    if (expr.isMatchExpr()) {
        var mh = expr.asMatchExpr()
        if (!mh.getMatchMode()) {
            return 2
        }
        if (mh.getSelector().asGradExpr().getDiffFuncExpr().asRefExpr().getIdentifier().value != "square") {
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
        if (mh.getMatchCases()[0].getExprOrdecls()[0].asExpr().asGradExpr().getDiffFuncExpr().asRefExpr().getIdentifier().value != "square") {
            return 10
        }
        if (!mh.getMatchCases()[1].getPattern().isConstPattern()) {
            return 11
        }
        if (mh.getMatchCases()[1].getPattern().asConstPattern().getPatternTerms()[0].asLitConstExpr().getLiteral().value != "10") {
            return 12
        }
        if (!mh.getMatchCases()[1].hasPatternGuard()) {
            return 13
        }
        if (mh.getMatchCases()[1].getPatternGuard().asLitConstExpr().getLiteral().value != "true") {
            return 14
        }
        if (mh.getMatchCases()[1].getExprOrdecls()[0].asExpr().asTupleLit().getChildren()[0].asLitConstExpr().getLiteral().value != "1") {
            return 15
        }

        if (!mh.getMatchCases()[2].getPattern().isConstPattern()) {
            return 11
        }
        if (mh.getMatchCases()[2].getPattern().asConstPattern().getPatternTerms()[0].asLitConstExpr().getLiteral().value != "10") {
            return 12
        }
        if (!mh.getMatchCases()[2].hasPatternGuard()) {
            return 13
        }
        if (mh.getMatchCases()[2].getPatternGuard().asLitConstExpr().getLiteral().value != "true") {
            return 14
        }
        if (!mh.getMatchCases()[2].getExprOrdecls()[0].asExpr().asTryExpr().getCatchPatterns()[0].isWildcardPattern()) {
            return 15
        }
        if (!mh.getMatchCases()[3].getPattern().isConstPattern()) {
            return 11
        }
        if (mh.getMatchCases()[3].getPattern().asConstPattern().getPatternTerms()[0].asLitConstExpr().getLiteral().value != "10") {
            return 12
        }
        if (!mh.getMatchCases()[3].hasPatternGuard()) {
            return 13
        }
        if (mh.getMatchCases()[3].getPatternGuard().asLitConstExpr().getLiteral().value != "true") {
            return 14
        }
        if (mh.getMatchCases()[3].getExprOrdecls()[0].asExpr().asThrowExpr().getExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "RunTime") {
            return 15
        }
        return 0
    }
    return 1
}
