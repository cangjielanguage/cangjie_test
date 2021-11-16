// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(start..=stop:step)
    let expr = ParseExpr(input)
    if (expr.isRangeExpr()) {
        var b = expr.asRangeExpr()
        if (b.getStartExpr().asRefExpr().getIdentifier().value != "start") {
            return 1
        }
        if (b.getStopExpr().asRefExpr().getIdentifier().value != "stop") {
            return 2
        }
        if (b.getStepExpr().asRefExpr().getIdentifier().value != "step") {
            return 3
        }
        if (!b.isClosed()) {
            return 4
        }
        return 0
    }
    return 5
}
