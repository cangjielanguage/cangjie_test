// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan [libast]: Parsing error

from ast import ast.*

func main() {
    var input: Tokens = quote(
         match {
            case func foo(){} => func foo(){}
         }
    )
    let expr = ParseExpr(input)
    if (!expr.isMatchExpr()) {
        return 0
    }
    return 1
}
