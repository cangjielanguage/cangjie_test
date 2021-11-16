// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(
        try {
            ();(1,2,3);[4,5,6];\@{a,b}
        } catch(e: RunTime) {
            ();(1,2,3);[4,5,6];\@{a,b}
        } finally {
            ();(1,2,3);[4,5,6];\@{a,b}
        }
    )
    let expr = ParseExpr(input)
    if (expr.isTryExpr()) {
        var b = expr.asTryExpr()
        if (!b.getTryBlock().getBody()[0].asExpr().isUnitExpr()) {
            return 2
        }
        if (!b.getCatchPatterns()[0].isExceptTypePattern()){
            return 3
        }
        if (b.getCatchPatterns()[0].asExceptTypePattern().getTypes()[0].asRefType().getIdentifier().value != "RunTime"){
            return 4
        }
        if (b.getCatchBlocks()[0].getBody()[1].asExpr().asTupleLit().getChildren()[0].asLitConstExpr().getLiteral().value != "1") {
            return 5
        }
        if (!b.hasFinallyBlock()){
            return 6
        }
        if (b.getFinallyBlock().getBody()[3].asExpr().asArrayLit().getChildren()[1].asRefExpr().getIdentifier().value != "b") {
            return 7
        }
        return 0
    }
    return 1
}
