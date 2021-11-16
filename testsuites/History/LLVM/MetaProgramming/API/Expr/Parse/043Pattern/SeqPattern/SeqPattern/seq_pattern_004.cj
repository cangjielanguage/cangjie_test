// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan [libast]: Parsing error

from ast import ast.*

func main() {
    var input: Tokens = quote(
         match (a) {
            case [..., ...] if (true) => b
         }
    )
    let expr = ParseExpr(input)
    return 0
}
