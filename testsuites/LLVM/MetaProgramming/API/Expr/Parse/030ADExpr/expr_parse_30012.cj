// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        valWithGrad(diff, (2.0, 3.0))
    )
    let expr = ParseExpr(input)
    if (expr.isValWithGradExpr()) {
        var b = expr.asValWithGradExpr()
        if (b.getDiffFuncExpr().asRefExpr().getIdentifier().value != "diff"){
            return 2
        }
        if (b.getInputValExpr().asTupleLit().getChildren()[0].asLitConstExpr().getLiteral().value != "2.0"){
            return 2
        }
        return 0
    }
    return 1
}
