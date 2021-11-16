// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(
        try {
            var a = b + 1
        } catch(_) {
            print("catch")
        } finally {
            a = 2
        }
    )
    let expr = ParseTryExpr(input)
    if (expr.getTryBlock().getBody()[0].asDecl().asVarDecl().getInitializer().asBinaryExpr().getLeftExpr().asRefExpr().getIdentifier().value != "b") {
        return 2
    }
    if (!expr.getCatchPatterns()[0].isWildcardPattern()){
        return 4
    }
    if (expr.getCatchBlocks()[0].getBody()[0].asExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "print") {
        return 3
    }
    if (!expr.hasFinallyBlock()){
        return 5
    }
    if (expr.getFinallyBlock().getBody()[0].asExpr().asAssignExpr().getLeftValue().asRefExpr().getIdentifier().value != "a") {
        return 6
    }
    return 0

}
