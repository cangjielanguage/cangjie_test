// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(a(){=>1}..b(){=>d}:c(){=>3})
    let expr = ParseRangeExpr(input)
    if (expr.getStartExpr().asTrailingClosureExpr().getExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "a") {
        return 1
    }
    if (expr.getStopExpr().asTrailingClosureExpr().getLambda().getLambdaBody()[0].asExpr().asRefExpr().getIdentifier().value != "d") {
        return 2
    }
    if (expr.getStepExpr().asTrailingClosureExpr().getExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "c") {
        return 3
    }
    if (expr.isClosed()) {
        return 4
    }
    return 0
}
