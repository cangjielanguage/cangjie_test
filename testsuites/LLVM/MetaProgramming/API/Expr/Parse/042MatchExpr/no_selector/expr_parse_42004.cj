// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         match {
            case a is B => a is B
            case -b => -b
            case (A) => (A)
            case obj(a) => obj(a)
         }
    )
    let expr = ParseExpr(input)
    if (expr.isMatchExpr()) {
        var mh = expr.asMatchExpr()
        if (mh.getMatchMode()) {
            return 2
        }
        if (!mh.getMatchCaseOthers()[0].getMatchExpr().isExpr()) {
            return 3
        }
        if (mh.getMatchCaseOthers()[0].getMatchExpr().asExpr().asIsExpr().getExpr().asRefExpr().getIdentifier().value != "a") {
            return 4
        }
        if (!mh.getMatchCaseOthers()[0].getExprOrDecls()[0].isExpr()) {
            return 6
        }
        if (mh.getMatchCaseOthers()[0].getExprOrDecls()[0].asExpr().asIsExpr().getExpr().asRefExpr().getIdentifier().value != "a") {
            return 7
        }
        if (!mh.getMatchCaseOthers()[1].getMatchExpr().isExpr()) {
            return 8
        }
        if (mh.getMatchCaseOthers()[1].getMatchExpr().asExpr().asUnaryExpr().getExpr().asRefExpr().getIdentifier().value != "b") {
            return 9
        }
        if (!mh.getMatchCaseOthers()[1].getExprOrDecls()[0].isExpr()) {
            return 10
        }
        if (mh.getMatchCaseOthers()[1].getExprOrDecls()[0].asExpr().asUnaryExpr().getExpr().asRefExpr().getIdentifier().value != "b") {
            return 11
        }
        if (!mh.getMatchCaseOthers()[2].getMatchExpr().isExpr()) {
            return 12
        }
        if (mh.getMatchCaseOthers()[2].getMatchExpr().asExpr().asParenExpr().getExpr().asRefExpr().getIdentifier().value != "A") {
            return 13
        }
        if (!mh.getMatchCaseOthers()[2].getExprOrDecls()[0].isExpr()) {
            return 14
        }
        if (mh.getMatchCaseOthers()[2].getExprOrDecls()[0].asExpr().asParenExpr().getExpr().asRefExpr().getIdentifier().value != "A") {
            return 15
        }
        if (!mh.getMatchCaseOthers()[3].getMatchExpr().isExpr()) {
            return 16
        }
        if (mh.getMatchCaseOthers()[3].getMatchExpr().asExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "obj") {
            return 17
        }
        if (!mh.getMatchCaseOthers()[3].getExprOrDecls()[0].isExpr()) {
            return 18
        }
        if (mh.getMatchCaseOthers()[3].getExprOrDecls()[0].asExpr().asCallExpr().getArgs()[0].getExpr().asRefExpr().getIdentifier().value != "a") {
            return 19
        }
        return 0
    }
    return 1
}
