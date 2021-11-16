// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(a=return 1)
    let expr = ParseExpr(input)
    if (expr.isAssignExpr()) {
        var b = expr.asAssignExpr()
        if (b.getLeftValue().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        if (b.getRightExpr().asReturnExpr().getExpr().asLitConstExpr().getLiteral().value != "1") {
            return 2
        }
        return 0
    }
    return 3
}
