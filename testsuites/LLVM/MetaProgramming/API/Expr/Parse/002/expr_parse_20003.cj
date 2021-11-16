// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(a+b+c)
    let expr = ParseExpr(input)
    if (expr.isBinaryExpr()) {
        var b = expr.asBinaryExpr()
        if (b.getLeftExpr().asBinaryExpr().getLeftExpr().asRefExpr().getIdentifier().value+
        b.getLeftExpr().asBinaryExpr().getRightExpr().asRefExpr().getIdentifier().value+
        b.getRightExpr().asRefExpr().getIdentifier().value == "abc") {
            return 0
        }
    }
    return 3
}
