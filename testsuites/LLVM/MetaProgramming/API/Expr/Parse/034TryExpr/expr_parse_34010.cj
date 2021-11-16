// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(
        try {
            var a:Int32 = 1
            a++
            a+b;
            -b;4
        } catch(e: RunTime) {
            var a:Int32 = 1
            a++
            a+b;
            -b;4
        } finally {
            var a:Int32 = 1
            a++
            a+b;
            -b
        }
    )
    let expr = ParseExpr(input)
    if (expr.isTryExpr()) {
        var b = expr.asTryExpr()
        if (b.getTryBlock().getBody()[0].asDecl().asVarDecl().getIdentifier().value != "a") {
            return 2
        }
        if (!b.getCatchPatterns()[0].isExceptTypePattern()){
            return 3
        }
        if (b.getCatchPatterns()[0].asExceptTypePattern().getTypes()[0].asRefType().getIdentifier().value != "RunTime"){
            return 4
        }
        if (b.getCatchBlocks()[0].getBody()[1].asExpr().asIncOrDecExpr().getExpr().asRefExpr().getIdentifier().value != "a") {
            return 5
        }
        if (!b.hasFinallyBlock()){
            return 6
        }
        if (b.getFinallyBlock().getBody()[2].asExpr().asBinaryExpr().getRightExpr().asRefExpr().getIdentifier().value != "b") {
            return 7
        }
        if (b.getFinallyBlock().getBody()[3].asExpr().asUnaryExpr().getExpr().asRefExpr().getIdentifier().value != "b") {
            return 7
        }
        return 0
    }
    return 1
}
