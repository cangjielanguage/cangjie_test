// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(Int64(a).b)
    let expr = ParseExpr(input)
    if (expr.isMemberAccess()) {
        var b = expr.asMemberAccess()
        if (b.getBaseExpr().asNumTypeConvExpr().getExpr().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        if (b.getBaseExpr().asNumTypeConvExpr().getType().getPrimitive().value != "Int64") {
            return 2
        }
        if (b.getField().value != "b") {
            return 3
        }
        return 0
    }
    return 4
}
