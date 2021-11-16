// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(
        try {
            var a = b + 1
        } finally {
            a = 2
        }
    )
    let expr = ParseExpr(input)
    if (expr.isTryExpr()) {
        var b = expr.asTryExpr()
        if (b.getCatchBlocks().size() != 0) {
            return 2
        }
        if (b.getTryBlock().getBody()[0].asDecl().asVarDecl().getInitializer().asBinaryExpr().getLeftExpr().asRefExpr().getIdentifier().value != "b") {
            return 3
        }
        if (!b.hasFinallyBlock()){
            return 4
        }
        if (b.getFinallyBlock().getBody()[0].asExpr().asAssignExpr().getLeftValue().asRefExpr().getIdentifier().value != "a") {
            return 5
        }
        if (b.getCatchPatterns().size() != 0){
            return 6
        }

        return 0
    }
    return 1
}
