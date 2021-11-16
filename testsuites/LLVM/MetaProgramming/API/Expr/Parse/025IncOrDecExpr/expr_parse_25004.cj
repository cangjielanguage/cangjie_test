// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan [libast]: Parsing error


from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(2--)
    let expr = ParseIncOrDecExpr(input)
    if (expr.getExpr().asLitConstExpr().getLiteral().value != "2") {
        return 1
    }
    if (expr.getOperatorKind() != TokenKind.DECR) {
        return 2
    }
    return 0
}
