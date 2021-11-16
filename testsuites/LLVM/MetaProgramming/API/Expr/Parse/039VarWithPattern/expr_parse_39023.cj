// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan [libast]: Parsing error

from ast import ast.*

func main() {
    var input: Tokens = quote(
        var (a,b):Int32*Char = a=b
    )
    let expr = ParseDecl(input)
    if (!expr.isVarWithPatternDecl()) {
        return 0
    }
    return 1

}
