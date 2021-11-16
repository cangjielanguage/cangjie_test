// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan invalid use of operator ':'
// ASSERT: scan [libast]: Parsing Error in ParseExpr

from ast import ast.*

func main() {
    var input: Tokens = quote(return 0..return 1:return 2)
    let expr = ParseRangeExpr(input)
    return 0
}
