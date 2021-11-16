// EXEC: %compiler %cmp_opt %use_ast %f -o %output 2>&1 |compare %f
// ASSERT: regex expected '\)'

from ast import ast.*

func main() {
    var input: Tokens = quote((a,b)
    let expr = ParseExpr(input)
    if (!expr.isTupleLit()) {
        return 0
    }
    return 5
}
