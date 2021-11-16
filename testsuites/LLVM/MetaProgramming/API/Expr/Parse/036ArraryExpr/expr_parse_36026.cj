// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex-auto [libast]: Parsing error
from ast import ast.*

func main() {
    var input: Tokens = quote(
         Array<T>
    )
    let expr = ParseArrayExpr(input)
    return 0
}