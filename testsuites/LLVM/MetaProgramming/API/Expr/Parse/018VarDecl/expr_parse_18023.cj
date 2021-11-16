// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan [libast]: Parsing error

from ast import ast.*

func main() {
    var input: Tokens = quote(var a = var b =1)
    let expr = ParseDecl(input)
    var b = expr.asVarDecl()
    if (b.getKeyword().value != "var") {
        return 2
    }
    if (b.getIdentifier().value != "a") {
        return 3
    }
    return 0
}
