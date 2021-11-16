// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex-auto expected '>' in the end of collection or tuple type or type parameters

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        a is A<Int64
    )
    let expr = ParseExpr(input)
    if (expr.isIsExpr()) {
        var tp = expr.asIsExpr().getType()
        if (!tp.isRefType()) {
            return 2
        }
        if (tp.asRefType().getIdentifier().value != "A<Int64") {
            return 3
        }

        return 0
    }
    return 1
}
