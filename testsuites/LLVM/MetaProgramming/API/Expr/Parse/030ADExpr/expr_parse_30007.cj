// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        grad(diff, args)
    )
    let expr = ParseExpr(input)
    if (expr.isGradExpr()) {
        var b = expr.asGradExpr()
        if (b.getDiffFuncExpr().asRefExpr().getIdentifier().value != "diff"){
            return 2
        }
        if (b.getInputValExpr().asRefExpr().getIdentifier().value != "args"){
            return 2
        }
        return 0
    }
    return 1
}
