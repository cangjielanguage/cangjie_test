// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(
        try {
            (B);
            A()
        } catch(e: RunTime) {
            (B);
            A()
        } finally {
            (B);
            A()
        }
    )
    let expr = ParseExpr(input)
    if (expr.isTryExpr()) {
        var b = expr.asTryExpr()
        if (b.getTryBlock().getBody()[0].asExpr().asParenExpr().getExpr().asRefExpr().getIdentifier().value != "B" ) {
            return 2
        }
        if (!b.getCatchPatterns()[0].isExceptTypePattern()){
            return 3
        }
        if (b.getCatchPatterns()[0].asExceptTypePattern().getTypes()[0].asRefType().getIdentifier().value != "RunTime"){
            return 4
        }
        if (b.getCatchBlocks()[0].getBody()[0].asExpr().asParenExpr().getExpr().asRefExpr().getIdentifier().value != "B" ) {
            return 5
        }
        if (!b.hasFinallyBlock()){
            return 6
        }
        if (b.getFinallyBlock().getBody()[1].asExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "A" ) {
            return 7
        }
        return 0
    }
    return 1
}
