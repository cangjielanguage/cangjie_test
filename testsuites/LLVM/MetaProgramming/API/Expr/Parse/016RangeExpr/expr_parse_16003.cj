// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(0..=10)
    let expr = ParseExpr(input)
    if (expr.isRangeExpr()) {
        var b = expr.asRangeExpr()
        if (b.getStartExpr().asLitConstExpr().getLiteral().value != "0") {
            return 1
        }
        if (b.getStopExpr().asLitConstExpr().getLiteral().value != "10") {
            return 2
        }
        if (!b.isClosed()) {
            return 4
        }
        return 0
    }
    return 5
}
