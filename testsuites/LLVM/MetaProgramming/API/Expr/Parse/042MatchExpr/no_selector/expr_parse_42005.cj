// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         match {
            case return a => return a
            case a=b => a=b
            case A.b<T> => A.b<T>
            case for (x in items) {1} => for (x in items) {1}
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
        if (mh.getMatchCaseOthers()[0].getMatchExpr().asExpr().asReturnExpr().getExpr().asRefExpr().getIdentifier().value != "a") {
            return 4
        }
        if (!mh.getMatchCaseOthers()[0].getExprOrDecls()[0].isExpr()) {
            return 6
        }
        if (mh.getMatchCaseOthers()[0].getExprOrDecls()[0].asExpr().asReturnExpr().getExpr().asRefExpr().getIdentifier().value != "a") {
            return 7
        }
        if (!mh.getMatchCaseOthers()[1].getMatchExpr().isExpr()) {
            return 8
        }
        if (mh.getMatchCaseOthers()[1].getMatchExpr().asExpr().asAssignExpr().getLeftValue().asRefExpr().getIdentifier().value != "a") {
            return 9
        }
        if (!mh.getMatchCaseOthers()[1].getExprOrDecls()[0].isExpr()) {
            return 10
        }
        if (mh.getMatchCaseOthers()[1].getExprOrDecls()[0].asExpr().asAssignExpr().getLeftValue().asRefExpr().getIdentifier().value != "a") {
            return 11
        }
        if (!mh.getMatchCaseOthers()[2].getMatchExpr().isExpr()) {
            return 12
        }
        if (mh.getMatchCaseOthers()[2].getMatchExpr().asExpr().asMemberAccess().getArgs()[0].asRefType().getIdentifier().value != "T") {
            return 13
        }
        if (!mh.getMatchCaseOthers()[2].getExprOrDecls()[0].isExpr()) {
            return 14
        }
        if (mh.getMatchCaseOthers()[2].getExprOrDecls()[0].asExpr().asMemberAccess().getArgs()[0].asRefType().getIdentifier().value != "T") {
            return 15
        }
        if (!mh.getMatchCaseOthers()[3].getMatchExpr().isExpr()) {
            return 16
        }
        if (mh.getMatchCaseOthers()[3].getMatchExpr().asExpr().asForInExpr().hasPatternGuard()) {
            return 17
        }
        if (!mh.getMatchCaseOthers()[3].getExprOrDecls()[0].isExpr()) {
            return 18
        }
        if (mh.getMatchCaseOthers()[3].getExprOrDecls()[0].asExpr().asForInExpr().hasPatternGuard()) {
            return 19
        }
        return 0
    }
    return 1
}
