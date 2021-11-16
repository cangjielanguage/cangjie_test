// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(a is Int64)
    let expr = ParseIsExpr(input)
    if (expr.getExpr().asRefExpr().getIdentifier().value != "a") {
        return 1
    }
    if (expr.getType().asPrimitiveType().getPrimitive().value != "Int64") {
        return 2
    }
    return 0

}
