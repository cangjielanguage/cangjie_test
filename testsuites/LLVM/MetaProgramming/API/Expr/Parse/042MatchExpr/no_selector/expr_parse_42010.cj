// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         match {
            case true => var a: A = b
            case true => func foo<T>(a:T,b!:Int64=1):Int64 where T<: B {}
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
        if (mh.getMatchCaseOthers()[0].getMatchExpr().asExpr().asLitConstExpr().getLiteral().value != "true") {
            return 4
        }
        if (!mh.getMatchCaseOthers()[0].getExprOrDecls()[0].isDecl()) {
            return 6
        }
        if (mh.getMatchCaseOthers()[0].getExprOrDecls()[0].asDecl().asVarDecl().getIdentifier().value != "a") {
            return 7
        }

        if (!mh.getMatchCaseOthers()[1].getMatchExpr().isExpr()) {
            return 12
        }
        if (mh.getMatchCaseOthers()[1].getMatchExpr().asExpr().asLitConstExpr().getLiteral().value != "true") {
            return 13
        }
        if (!mh.getMatchCaseOthers()[1].getExprOrDecls()[0].isDecl()) {
            return 14
        }
        if (mh.getMatchCaseOthers()[1].getExprOrDecls()[0].asDecl().asFuncDecl().getIdentifier().value != "foo") {
            return 15
        }
        return 0
    }
    return 1
}
