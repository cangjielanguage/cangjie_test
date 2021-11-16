// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input: Tokens = quote(1 as Int64)
    let expr = ParseExpr(input)
    if (expr.isAsExpr()) {
        var b = expr.asAsExpr()
        if (b.getExpr().asLitConstExpr().getLiteral().value != "1") {
            return 1
        }
        if (b.getType().asPrimitiveType().getPrimitive().value != "Int64") {
            return 2
        }
        return 0
    }
    return 3
}
