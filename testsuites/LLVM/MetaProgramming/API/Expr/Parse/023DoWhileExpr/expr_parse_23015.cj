// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        do {
            if (true){
                c
            } else {
                d
            }
        } while (
                if (false) {
                    a
                } else {
                    b
                }
            )
        )
    let expr = ParseExpr(input)
    if (expr.isDoWhileExpr()) {
        var b = expr.asDoWhileExpr()
        if (b.getCondExpr().asIfExpr().getIfBody()[0].asExpr().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        if (b.getBody()[0].asExpr().asIfExpr().getElseBranch().asExpr().asBlock().getBody()[0].asExpr().asRefExpr().getIdentifier().value != "d") {
            return 3
        }
        return 0
    }
    return 10
}
