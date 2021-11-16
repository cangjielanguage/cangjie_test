// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(1>=a)
    let expr = ParseExpr(input)
    if (expr.isBinaryExpr()) {
        var b = expr.asBinaryExpr()
        if (b.getLeftExpr().asLitConstExpr().getLiteral().value != "1") {
            return 1
        }
        if (b.getRightExpr().asRefExpr().getIdentifier().value != "a") {
            return 2
        }
        return 0
    }
    return 3
}
