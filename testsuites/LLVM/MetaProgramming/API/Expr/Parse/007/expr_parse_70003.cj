// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(return 1+2)
    let expr = ParseExpr(input)
    if (expr.isReturnExpr()) {
        var b = expr.asReturnExpr()
        if (b.getExpr().asBinaryExpr().getLeftExpr().asLitConstExpr().getLiteral().value != "1") {
            return 1
        }
        if (b.getExpr().asBinaryExpr().getRightExpr().asLitConstExpr().getLiteral().value != "2") {
            return 2
        }
        return 0
    }
    return 3
}
