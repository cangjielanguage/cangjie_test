// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input : Tokens = quote(if (true) {a} else{1})
    let expr = ParseExpr(input)
    if (expr.isIfExpr()) {
        var b = expr.asIfExpr()
        if (b.getCondExpr().asLitConstExpr().getLiteral().value != "true") {
            return 1
        }
        if (b.getIfBody()[0].asExpr().asRefExpr().getIdentifier().value != "a") {
            return 2
        }
        if (b.getElseBranch().asExpr().asBlock().getBody()[0].asExpr().asLitConstExpr().getLiteral().value != "1") {
            return 3
        }

        return 0
    }
    return 4
}
