// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan [libast]: Parsing error


from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(()++)
    let expr = ParseExpr(input)
    if (expr.isIncOrDecExpr()) {
        var b = expr.asIncOrDecExpr()
        if (!b.getExpr().isUnitExpr()) {
            return 2
        }
        if (b.getOperatorKind() != TokenKind.INCR) {
            return 3
        }
        return 0
    }
    return 4
}
