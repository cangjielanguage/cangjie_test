// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan [libast]: Parsing error

from ast import ast.*

func main() {
    var input: Tokens = quote(
         type A = This
    )
    let expr = ParseDecl(input)
    if (expr.isTypeAliasDecl()) {
        var tp = expr.asTypeAliasDecl().getType()
        if (!tp.isThisType()) {
            return 5
        }
        if (tp.asThisType().getThis().value != "This") {
            return 5
        }
        return 0
    }
    return 1
}
