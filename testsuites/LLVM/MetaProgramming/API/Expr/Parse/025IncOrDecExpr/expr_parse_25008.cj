// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan [libast]: Parsing error


from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(a()++)
    let expr = ParseExpr(input)
    if (expr.isIncOrDecExpr()) {
        var b = expr.asIncOrDecExpr()
        if (b.getExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        if (b.getOperatorKind() != TokenKind.INCR) {
            return 2
        }
        return 0
    }
    return 3
}
