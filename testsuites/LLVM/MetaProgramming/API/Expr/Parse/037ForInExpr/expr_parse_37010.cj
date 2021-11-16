// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
        for (i in a is A) if (a is A){
            a is Int64
        }
    )
    let expr = ParseExpr(input)
    if (expr.isForInExpr()) {
        var forExpr = expr.asForInExpr()
        if (forExpr.getPattern().asVarPattern().getVarDecl().getIdentifier().value != "i") {
            return 2
        }
        if (forExpr.getInExpr().asIsExpr().getExpr().asRefExpr().getIdentifier().value != "a") {
            return 3
        }
        if (!forExpr.hasPatternGuard()){
            return 5
        }
        if (forExpr.getPatternGuard().asIsExpr().getType().asRefType().getIdentifier().value != "A") {
            return 6
        }
        if (forExpr.getBody()[0].asExpr().asIsExpr().getType().asPrimitiveType().getPrimitive().value != "Int64") {
            return 7
        }
        return 0
    }
    return 1
}
