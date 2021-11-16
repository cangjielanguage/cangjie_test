// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(do {b as Bool} while (a as Bool))
    let expr = ParseExpr(input)
    if (expr.isDoWhileExpr()) {
        var b = expr.asDoWhileExpr()
        if (b.getCondExpr().asAsExpr().getExpr().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        if (b.getCondExpr().asAsExpr().getType().asPrimitiveType().getPrimitive().value  != "Bool") {
            return 2
        }
        if (b.getBody()[0].asExpr().asAsExpr().getExpr().asRefExpr().getIdentifier().value != "b") {
            return 3
        }
        if (b.getBody()[0].asExpr().asAsExpr().getType().asPrimitiveType().getPrimitive().value != "Bool") {
            return 4
        }
        return 0
    }
    return 10
}
