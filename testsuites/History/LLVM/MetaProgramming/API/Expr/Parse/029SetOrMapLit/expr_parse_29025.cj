// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan [libast]: Parsing error

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        #{1:}
    )
    let expr = ParseExpr(input)
    return 0
}
