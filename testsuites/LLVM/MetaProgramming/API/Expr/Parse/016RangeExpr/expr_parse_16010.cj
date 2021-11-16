// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(a.b..b.c:c.d)
    let expr = ParseRangeExpr(input)
    if (expr.getStartExpr().asMemberAccess().getBaseExpr().asRefExpr().getIdentifier().value != "a") {
        return 1
    }
    if (expr.getStopExpr().asMemberAccess().getField().value != "c") {
        return 2
    }
    if (expr.getStepExpr().asMemberAccess().getBaseExpr().asRefExpr().getIdentifier().value != "c") {
        return 3
    }
    if (expr.isClosed()) {
        return 4
    }
    return 0
}
