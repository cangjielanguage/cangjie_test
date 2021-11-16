// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*

func main() {
    var input: Tokens = quote(
         Array<T>(throw RunTime(), throw RunTime())
    )
    let expr = ParseExpr(input)
    if (expr.isArrayExpr()) {
        var array = expr.asArrayExpr()
        if (!array.getType().isArrayType()) {
            return 2
        }
        if (array.getArgs()[0].asThrowExpr().getExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "RunTime") {
            return 3
        }
        if (array.getArgs()[1].asThrowExpr().getExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "RunTime"){
            return 4
        }
        return 0
    }
    return 1
}
