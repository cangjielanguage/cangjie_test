// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote(a=b)
    let expr = ParseAssignExpr(input)
    if (expr.getLeftValue().asRefExpr().getIdentifier().value != "a") {
        return 1
    }
    if (expr.getRightExpr().asRefExpr().getIdentifier().value != "b") {
        return 2
    }
    return 0

}
