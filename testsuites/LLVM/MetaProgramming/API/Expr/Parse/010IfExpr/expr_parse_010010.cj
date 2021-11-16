// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input : Tokens = quote(
        if (true) {
            a+b
        } else {
            a+b
        }
    )
    let expr = ParseExpr(input)
    if (expr.isIfExpr()) {
        var b = expr.asIfExpr()
        if (b.getCondExpr().asLitConstExpr().getLiteral().value != "true") {
            return 2
        }
        if (b.getIfBody()[0].asExpr().asBinaryExpr().getLeftExpr().asRefExpr().getIdentifier().value != "a") {
            return 3
        }
        if (b.getElseBranch().asExpr().asBlock().getBody()[0].asExpr().asBinaryExpr().getRightExpr().asRefExpr().getIdentifier().value != "b") {
            return 4
        }

        return 0
    }
    return 4
}
