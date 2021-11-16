// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
        for (i in { x:Int32 => 2 }) if ({ x:Int32 => 2 }){
            { x:Int32 => 2 }
        }
    )
    let expr = ParseExpr(input)
    if (expr.isForInExpr()) {
        var forExpr = expr.asForInExpr()
        if (forExpr.getPattern().asVarPattern().getVarDecl().getIdentifier().value != "i") {
            return 2
        }
        if (forExpr.getInExpr().asLambdaExpr().getLambdaParams()[0].getIdentifier().value != "x") {
            return 3
        }
        if (!forExpr.hasPatternGuard()){
            return 5
        }
        if (forExpr.getPatternGuard().asLambdaExpr().getLambdaBody()[0].asExpr().asLitConstExpr().getLiteral().value != "2") {
            return 6
        }
        if (forExpr.getBody()[0].asExpr().asLambdaExpr().getLambdaParams()[0].getIdentifier().value != "x") {
            return 7
        }
        return 0
    }
    return 1
}
