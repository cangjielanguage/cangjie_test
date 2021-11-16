// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(
        try {
            var a = b + 1
        } catch(e: RunTime) {
            print("catch")
        } finally {
            a = 2
        }
    )
    let expr = ParseExpr(input)
    if (expr.isTryExpr()) {
        var b = expr.asTryExpr()

        if (b.getTryBlock().getBody()[0].asDecl().asVarDecl().getInitializer().asBinaryExpr().getLeftExpr().asRefExpr().getIdentifier().value != "b") {
            return 2
        }
        if (!b.getCatchPatterns()[0].isExceptTypePattern()){
            return 4
        }
        if (b.getCatchPatterns()[0].asExceptTypePattern().getTypes()[0].asRefType().getIdentifier().value != "RunTime"){
            return 4
        }
        if (b.getCatchBlocks()[0].getBody()[0].asExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "print") {
            return 3
        }
        if (!b.hasFinallyBlock()){
            return 5
        }
        if (b.getFinallyBlock().getBody()[0].asExpr().asAssignExpr().getLeftValue().asRefExpr().getIdentifier().value != "a") {
            return 6
        }
        return 0
    }
    return 1
}
