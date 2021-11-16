// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex-auto [libast]: Parsing error

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        a is (This,This)->This
    )
    let expr = ParseExpr(input)
    if (expr.isIsExpr()) {
        return 0
    }
    return 1
}
