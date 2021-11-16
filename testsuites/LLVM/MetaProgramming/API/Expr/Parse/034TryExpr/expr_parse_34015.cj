// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(
        try {
            if (a) {
                b
            } else {
                c
            }
        } catch(e: RunTime) {
            if (a) {
                b
            } else {
                c
            }
        } finally {
            if (a) {
                b
            } else {
                c
            }
        }
    )
    let expr = ParseExpr(input)
    if (expr.isTryExpr()) {
        var b = expr.asTryExpr()
        if (b.getTryBlock().getBody()[0].asExpr().asIfExpr().getCondExpr().asRefExpr().getIdentifier().value != "a" ) {
            return 2
        }
        if (!b.getCatchPatterns()[0].isExceptTypePattern()){
            return 3
        }
        if (b.getCatchPatterns()[0].asExceptTypePattern().getTypes()[0].asRefType().getIdentifier().value != "RunTime"){
            return 4
        }
        if (b.getCatchBlocks()[0].getBody()[0].asExpr().asIfExpr().getIfBody()[0].asExpr().asRefExpr().getIdentifier().value != "b" ) {
            return 5
        }
        if (!b.hasFinallyBlock()){
            return 6
        }
        if (b.getFinallyBlock().getBody()[0].asExpr().asIfExpr().getElseBranch().asExpr().asBlock().getBody()[0].asExpr().asRefExpr().getIdentifier().value != "c") {
            return 7
        }
        return 0
    }
    return 1
}
