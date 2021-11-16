// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(a?.b=c)
    let expr = ParseExpr(input)
    if (expr.isAssignExpr()) {
        var b = expr.asAssignExpr()
        if (b.getLeftValue().asMemberAccess().getBaseExpr().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        if (b.getRightExpr().asRefExpr().getIdentifier().value != "c") {
            return 2
        }
        return 0
    }
    return 3
}
