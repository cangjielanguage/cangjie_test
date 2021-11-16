// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(if (true) {1} else {2}..if (true) {a} else {b}:if (true) {a} else {b})
    let expr = ParseRangeExpr(input)
    if (expr.getStartExpr().asIfExpr().getCondExpr().asLitConstExpr().getLiteral().value != "true") {
        return 1
    }
    if (expr.getStopExpr().asIfExpr().getIfBody()[0].asExpr().asRefExpr().getIdentifier().value != "a") {
        return 2
    }
    if (expr.getStepExpr().asIfExpr().getElseBranch().asExpr().asBlock().getBody()[0].asExpr().asRefExpr().getIdentifier().value != "b") {
        return 3
    }
    if (expr.isClosed()) {
        return 4
    }
    return 0
}
