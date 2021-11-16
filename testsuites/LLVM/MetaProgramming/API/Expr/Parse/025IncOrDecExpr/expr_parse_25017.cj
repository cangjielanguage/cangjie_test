// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan [libast]: Parsing error


from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(if (true) {a} else {b}--)
    let expr = ParseExpr(input)
    if (expr.isIncOrDecExpr()) {
        var b = expr.asIncOrDecExpr()
        if (b.getExpr().asIfExpr().getCondExpr().asLitConstExpr().getLiteral().value != "true") {
            return 1
        }
        if (b.getExpr().asIfExpr().getIfBody()[0].asExpr().asRefExpr().getIdentifier().value != "a") {
            return 2
        }
        if (b.getExpr().asIfExpr().getElseBranch().asExpr().asBlock().getBody()[0].asExpr().asRefExpr().getIdentifier().value != "b") {
            return 3
        }
        if (b.getOperatorKind() != TokenKind.DECR) {
            return 4
        }
        return 0
    }
    return 5
}
