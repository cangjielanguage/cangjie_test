// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         match {
            case a>b => 1
            case _ => var a = b
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
        mh.getMatchCaseOthers()[1].getMatchExpr().toTokens().dump()
        if (!mh.getMatchCaseOthers()[1].getExprOrDecls()[0].isDecl()) {
            return 5
        }
        if (mh.getMatchCaseOthers()[1].getExprOrDecls()[0].asDecl().asVarDecl().getIdentifier().value != "a") {
            return 6
        }
        return 0
    }
    return 1
}
