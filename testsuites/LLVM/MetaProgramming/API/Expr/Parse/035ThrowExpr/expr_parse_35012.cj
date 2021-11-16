// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(
         throw if (a) {
                b
            } else {
                c
            }
    )
    let expr = ParseExpr(input)
    if (expr.isThrowExpr()) {
        var b = expr.asThrowExpr()
        if (b.getExpr().asIfExpr().getCondExpr().asRefExpr().getIdentifier().value != "a") {
            return 2
        }
        if (b.getExpr().asIfExpr().getIfBody()[0].asExpr().asRefExpr().getIdentifier().value != "b" ) {
            return 3
        }
        if (b.getExpr().asIfExpr().getElseBranch().asExpr().asBlock().getBody()[0].asExpr().asRefExpr().getIdentifier().value != "c") {
            return 4
        }
        return 0
    }
    return 1
}
