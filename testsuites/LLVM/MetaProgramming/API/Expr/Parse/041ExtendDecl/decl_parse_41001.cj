// EXEC: %compiler %cmp_opt %use_ast %f -o %output 2>&1 | compare %f
// ASSERT: regex 'getIdentifier' is not a member of class 'NodeFormat_ExtendDecl'

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        extend A<Int64> {func foo() {}}
    )
    let expr = ParseDecl(input)
    if (expr.isExtendDecl()) {
        var b = expr.asExtendDecl()
        b.getIdentifier()
        return 0
    }
    return 1
}
