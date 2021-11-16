// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(return 1 + return a)
    let expr = ParseExpr(input)
    if (expr.isBinaryExpr()) { // is return (1 + return a)
        var b = expr.asBinaryExpr()
        if (b.getLeftExpr().asReturnExpr().getExpr().asLitConstExpr().getLiteral().value != "1") {
            return 1
        }
        if (b.getRightExpr().asReturnExpr().getExpr().asRefExpr().getIdentifier().value != "a") {
            return 2
        }
        return 3
    }
    return 0
}
