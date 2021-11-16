// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(while ((A)){(b)})
    let expr = ParseExpr(input)
    if (expr.isWhileExpr()) {
        var b = expr.asWhileExpr()
        if (b.getCondExpr().asParenExpr().getExpr().asRefExpr().getIdentifier().value != "A") {
            return 1
        }
        if (b.getBody()[0].asExpr().asParenExpr().getExpr().asRefExpr().getIdentifier().value != "b") {
            return 3
        }
        return 0
    }
    return 10
}
