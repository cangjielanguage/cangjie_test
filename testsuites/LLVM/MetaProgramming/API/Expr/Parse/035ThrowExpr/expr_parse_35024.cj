// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(
         throw RunTime()
    )
    let expr = ParseThrowExpr(input)
    if (expr.getExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "RunTime") {
        return 2
    }
    return 0

}
