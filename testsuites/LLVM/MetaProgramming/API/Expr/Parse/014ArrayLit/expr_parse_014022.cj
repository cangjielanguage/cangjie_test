// EXEC: %compiler %cmp_opt %use_ast %f -o %output 2>&1 |compare %f
// ASSERT: regex invalid at token here, do you mean '\\@' \?

from ast import ast.*

func main() {
    var input: Tokens = quote(@{a,b})
    let expr = ParseExpr(input)
    if (!expr.isArrayLit ()) {
        return 0
    }
    return 5
}
