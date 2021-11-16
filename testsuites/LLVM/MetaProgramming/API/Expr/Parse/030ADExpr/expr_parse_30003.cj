// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        adjointOf(foo)
    )
    let expr = ParseAdjointExpr(input)
    if (expr.getDiffFuncExpr().asRefExpr().getIdentifier().value != "foo"){
        return 2
    }
    return 0

}
