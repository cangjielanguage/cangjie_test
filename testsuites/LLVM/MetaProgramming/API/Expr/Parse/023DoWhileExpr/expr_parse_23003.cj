// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(do {a} while (true))
    let expr = ParseDoWhileExpr(input)
    if (expr.getCondExpr().asLitConstExpr().getLiteral().value != "true") {
        return 1
    }
    if (expr.getBody()[0].asExpr().asRefExpr().getIdentifier().value != "a") {
        return 2
    }
    return 0
}
