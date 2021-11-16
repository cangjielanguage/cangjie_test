// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         match {
            case grad(square, 1.0) => grad(square, 1.0);grad(square, 1.0);grad(square, 1.0);
            case (1,2,3) => (1,2,3)
            case try {} catch(_) {} finally {} => try {} catch(_) {} finally {}
            case throw RunTime() => throw RunTime()
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
        if (mh.getMatchCaseOthers()[0].getMatchExpr().asExpr().asGradExpr().getDiffFuncExpr().asRefExpr().getIdentifier().value != "square") {
            return 4
        }
        if (!mh.getMatchCaseOthers()[0].getExprOrDecls()[2].isExpr()) {
            return 6
        }
        if (mh.getMatchCaseOthers()[0].getExprOrDecls()[2].asExpr().asGradExpr().getDiffFuncExpr().asRefExpr().getIdentifier().value != "square") {
            return 7
        }
        if (!mh.getMatchCaseOthers()[1].getMatchExpr().isExpr()) {
            return 8
        }
        if (mh.getMatchCaseOthers()[1].getMatchExpr().asExpr().asTupleLit().getChildren()[0].asLitConstExpr().getLiteral().value != "1") {
            return 9
        }
        if (!mh.getMatchCaseOthers()[1].getExprOrDecls()[0].isExpr()) {
            return 10
        }
        if (mh.getMatchCaseOthers()[1].getExprOrDecls()[0].asExpr().asTupleLit().getChildren()[0].asLitConstExpr().getLiteral().value != "1") {
            return 11
        }
        if (!mh.getMatchCaseOthers()[2].getMatchExpr().isExpr()) {
            return 12
        }
        if (!mh.getMatchCaseOthers()[2].getMatchExpr().asExpr().asTryExpr().getCatchPatterns()[0].isWildcardPattern()) {
            return 13
        }
        if (!mh.getMatchCaseOthers()[2].getExprOrDecls()[0].isExpr()) {
            return 14
        }
        if (!mh.getMatchCaseOthers()[2].getExprOrDecls()[0].asExpr().asTryExpr().getCatchPatterns()[0].isWildcardPattern()) {
            return 15
        }
        if (!mh.getMatchCaseOthers()[3].getMatchExpr().isExpr()) {
            return 16
        }
        if (mh.getMatchCaseOthers()[3].getMatchExpr().asExpr().asThrowExpr().getExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "RunTime") {
            return 17
        }
        if (!mh.getMatchCaseOthers()[3].getExprOrDecls()[0].isExpr()) {
            return 18
        }
        if (mh.getMatchCaseOthers()[3].getExprOrDecls()[0].asExpr().asThrowExpr().getExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "RunTime") {
            return 19
        }
        return 0
    }
    return 1
}
