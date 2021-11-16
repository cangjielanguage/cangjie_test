// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         match {
            case a > b => 1
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
        if (mh.getMatchCaseOthers()[0].getMatchExpr().asExpr().asBinaryExpr().getLeftExpr().asRefExpr().getIdentifier().value != "a") {
            return 4
        }
        if (mh.getMatchCaseOthers()[0].getMatchExpr().asExpr().asBinaryExpr().getRightExpr().asRefExpr().getIdentifier().value != "b") {
            return 5
        }
        if (!mh.getMatchCaseOthers()[0].getExprOrDecls()[0].isExpr()) {
            return 6
        }
        if (mh.getMatchCaseOthers()[0].getExprOrDecls()[0].asExpr().asLitConstExpr().getLiteral().value != "1") {
            return 7
        }
        return 0
    }
    return 1
}
