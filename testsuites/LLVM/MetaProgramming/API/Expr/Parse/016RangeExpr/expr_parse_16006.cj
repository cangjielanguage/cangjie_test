// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(-a..-b:-c)
    let expr = ParseRangeExpr(input)
    if (expr.getStartExpr().asUnaryExpr().getExpr().asRefExpr().getIdentifier().value != "a") {
        return 1
    }
    if (expr.getStopExpr().asUnaryExpr().getExpr().asRefExpr().getIdentifier().value != "b") {
        return 2
    }
    if (expr.getStepExpr().asUnaryExpr().getExpr().asRefExpr().getIdentifier().value != "c") {
        return 3
    }
    if (expr.isClosed()) {
        return 4
    }
    return 0

}
