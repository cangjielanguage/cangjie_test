// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
        for (i in A.b<T>) if (A.b<T>){
            A.b<T>
        }
    )
    let expr = ParseExpr(input)
    if (expr.isForInExpr()) {
        var forExpr = expr.asForInExpr()
        if (forExpr.getPattern().asVarPattern().getVarDecl().getIdentifier().value != "i") {
            return 2
        }
        if (forExpr.getInExpr().asMemberAccess().getBaseExpr().asRefExpr().getIdentifier().value != "A") {
            return 3
        }
        if (!forExpr.hasPatternGuard()){
            return 5
        }
        if (forExpr.getPatternGuard().asMemberAccess().getArgs()[0].asRefType().getIdentifier().value != "T") {
            return 6
        }
        if (forExpr.getBody()[0].asExpr().asMemberAccess().getArgs()[0].asRefType().getIdentifier().value != "T") {
            return 7
        }
        return 0
    }
    return 1
}
