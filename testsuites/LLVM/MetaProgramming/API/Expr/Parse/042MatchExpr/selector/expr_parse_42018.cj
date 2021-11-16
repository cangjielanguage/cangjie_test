// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         match (a(){3}) {
            case 10 if (true) => a(){3}
            case 10 if (true) => spawn {x}
            case 10 if (true) => synchronized(mtx2) {}
            case 10 if (true) => ()
         }
    )
    let expr = ParseExpr(input)
    if (expr.isMatchExpr()) {
        var mh = expr.asMatchExpr()
        if (!mh.getMatchMode()) {
            return 2
        }
        if (mh.getSelector().asTrailingClosureExpr().getExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "a") {
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
        if (mh.getMatchCases()[0].getExprOrdecls()[0].asExpr().asTrailingClosureExpr().getExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "a") {
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
        if (mh.getMatchCases()[1].getExprOrdecls()[0].asExpr().asSpawnExpr().getTaskExpr().asLambdaExpr().getLambdaBody()[0].asExpr().asRefExpr().getIdentifier().value != "x") {
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
        if (mh.getMatchCases()[2].getExprOrdecls()[0].asExpr().asSynchronizedExpr().getMutexExpr().asRefExpr().getIdentifier().value != "mtx2") {
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
        if (!mh.getMatchCases()[3].getExprOrdecls()[0].asExpr().isUnitExpr()) {
            return 15
        }
        return 0
    }
    return 1
}
