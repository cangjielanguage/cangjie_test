// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(while (a is Bool){b is Bool})
    let expr = ParseExpr(input)
    if (expr.isWhileExpr()) {
        var b = expr.asWhileExpr()
        if (b.getCondExpr().asIsExpr().getExpr().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        if (b.getCondExpr().asIsExpr().getType().asPrimitiveType().getPrimitive().value  != "Bool") {
            return 2
        }
        if (b.getBody()[0].asExpr().asIsExpr().getExpr().asRefExpr().getIdentifier().value != "b") {
            return 3
        }
        if (b.getBody()[0].asExpr().asIsExpr().getType().asPrimitiveType().getPrimitive().value != "Bool") {
            return 4
        }
        return 0
    }
    return 10
}
