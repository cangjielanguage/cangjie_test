// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan [libast]: Parsing error

from ast import ast.*

func main() {
    var input: Tokens = quote(
         for (3 in list) if {}
    )
    let expr = ParseExpr(input)
    if (expr.isForInExpr()) {
        if (!expr.asForInExpr().getPattern().isConstPattern()) {
            return 2
        }
        return 0
    }
    return 1
}
