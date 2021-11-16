// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan [libast]: Parsing error

from ast import ast.*

func main() {
    var input: Tokens = quote(
        try {
            var a = b + 1
        }
    )
    let expr = ParseTryExpr(input)
    return 0
}
