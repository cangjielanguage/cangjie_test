// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(while (true){a})
    let expr = ParseExpr(input)
    if (expr.isWhileExpr()) {
        var b = expr.asWhileExpr()
        if (b.getCondExpr().asLitConstExpr().getLiteral().value != "true") {
            return 1
        }
        if (b.getBody()[0].asExpr().asRefExpr().getIdentifier().value != "a") {
            return 2
        }
        return 0
    }
    return 3
}
