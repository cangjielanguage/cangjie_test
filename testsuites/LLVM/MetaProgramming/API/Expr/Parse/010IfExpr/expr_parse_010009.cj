// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input : Tokens = quote(
        if (true) {
            a
            !b
        } else {
            a.b = 1
            2
        }
    )
    let expr = ParseExpr(input)
    if (expr.isIfExpr()) {
        var b = expr.asIfExpr()
        if (b.getCondExpr().asLitConstExpr().getLiteral().value != "true") {
            return 1
        }
        if (b.getIfBody()[1].asExpr().asUnaryExpr().getExpr().asRefExpr().getIdentifier().value != "b") {
            return 2
        }
        if (b.getElseBranch().asExpr().asBlock().getBody()[1].asExpr().asLitConstExpr().getLiteral().value != "2") {
            return 3
        }

        return 0
    }
    return 4
}
