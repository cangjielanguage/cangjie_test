// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
        for (i in 1) if ("2"){
            3.0
        }
    )
    let expr = ParseExpr(input)
    if (expr.isForInExpr()) {
        var forExpr = expr.asForInExpr()
        if (forExpr.getPattern().asVarPattern().getVarDecl().getIdentifier().value != "i") {
            return 2
        }
        if (forExpr.getInExpr().asLitConstExpr().getLiteral().value != "1") {
            return 3
        }
        if (!forExpr.hasPatternGuard()){
            return 5
        }
        if (forExpr.getPatternGuard().asLitConstExpr().getLiteral().value != "2") {
            return 6
        }
        if (forExpr.getBody()[0].asExpr().asLitConstExpr().getLiteral().value != "3.0") {
            return 7
        }
        return 0
    }
    return 1
}
