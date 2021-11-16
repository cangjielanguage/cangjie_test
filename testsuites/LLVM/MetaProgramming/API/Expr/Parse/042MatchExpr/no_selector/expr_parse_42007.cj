// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         match {
            case a(){3} => a(){3}
            case spawn {x} => spawn {x}
            case synchronized(mtx2) {} => synchronized(mtx2) {}
            case () => ()
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
        if (mh.getMatchCaseOthers()[0].getMatchExpr().asExpr().asTrailingClosureExpr().getExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "a") {
            return 4
        }
        if (!mh.getMatchCaseOthers()[0].getExprOrDecls()[0].isExpr()) {
            return 6
        }
        if (mh.getMatchCaseOthers()[0].getExprOrDecls()[0].asExpr().asTrailingClosureExpr().getExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "a") {
            return 7
        }
        if (!mh.getMatchCaseOthers()[1].getMatchExpr().isExpr()) {
            return 8
        }
        if (mh.getMatchCaseOthers()[1].getMatchExpr().asExpr().asSpawnExpr().getTaskExpr().asLambdaExpr().getLambdaBody()[0].asExpr().asRefExpr().getIdentifier().value != "x") {
            return 9
        }
        if (!mh.getMatchCaseOthers()[1].getExprOrDecls()[0].isExpr()) {
            return 10
        }
        if (mh.getMatchCaseOthers()[1].getExprOrDecls()[0].asExpr().asSpawnExpr().getTaskExpr().asLambdaExpr().getLambdaBody()[0].asExpr().asRefExpr().getIdentifier().value != "x") {
            return 11
        }
        if (!mh.getMatchCaseOthers()[2].getMatchExpr().isExpr()) {
            return 12
        }
        if (mh.getMatchCaseOthers()[2].getMatchExpr().asExpr().asSynchronizedExpr().getMutexExpr().asRefExpr().getIdentifier().value != "mtx2") {
            return 13
        }
        if (!mh.getMatchCaseOthers()[2].getExprOrDecls()[0].isExpr()) {
            return 14
        }
        if (mh.getMatchCaseOthers()[2].getExprOrDecls()[0].asExpr().asSynchronizedExpr().getMutexExpr().asRefExpr().getIdentifier().value != "mtx2") {
            return 15
        }
        if (!mh.getMatchCaseOthers()[3].getMatchExpr().isExpr()) {
            return 16
        }
        if (!mh.getMatchCaseOthers()[3].getMatchExpr().asExpr().isUnitExpr()) {
            return 17
        }
        if (!mh.getMatchCaseOthers()[3].getExprOrDecls()[0].isExpr()) {
            return 18
        }
        if (!mh.getMatchCaseOthers()[3].getExprOrDecls()[0].asExpr().isUnitExpr()) {
            return 19
        }
        return 0
    }
    return 1
}
