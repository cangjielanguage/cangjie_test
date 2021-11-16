// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(while (if (true) {a} else {b}){if (true) {c} else {d}})
    let expr = ParseExpr(input)
    if (expr.isWhileExpr()) {
        var b = expr.asWhileExpr()
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
