// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input: Tokens = quote(a as A is Bool)
    let expr = ParseExpr(input)
    if (expr.isIsExpr()) {
        var b = expr.asIsExpr()
        if (b.getExpr().asAsExpr().getExpr().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        if (b.getType().asPrimitiveType().getPrimitive().value != "Bool") {
            return 2
        }
        return 0
    }
    return 3
}
