// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input : Tokens = quote(if (true) {a})
    let expr = ParseExpr(input)
    try {
        var b = expr.asIfExpr().getElseBranch()
    } catch (_) {
        return 0
    }
    return 1
}