// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote((a)..(b):(1))
    let expr = ParseRangeExpr(input)
    if (expr.getStartExpr().asParenExpr().getExpr().asRefExpr().getIdentifier().value != "a") {
        return 1
    }
    if (expr.getStopExpr().asParenExpr().getExpr().asRefExpr().getIdentifier().value != "b") {
        return 2
    }
    if (expr.getStepExpr().asParenExpr().getExpr().asLitConstExpr().getLiteral().value != "1") {
        return 3
    }
    if (expr.isClosed()) {
        return 4
    }
    return 0

}
