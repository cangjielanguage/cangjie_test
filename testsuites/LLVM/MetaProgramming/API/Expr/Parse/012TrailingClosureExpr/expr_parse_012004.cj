// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(a.foo(){a => 1})
    let expr = ParseExpr(input)
    if (expr.isTrailingClosureExpr()) {
        var b = expr.asTrailingClosureExpr()
        if (b.getExpr().asCallExpr().getBaseFunc().asMemberAccess().getField().value != "foo"){
            return 1
        }
        if (b.getExpr().asCallExpr().getBaseFunc().asMemberAccess().getBaseExpr().asRefExpr().getIdentifier().value != "a"){
            return 2
        }
        if (b.getLambda().getLambdaBody()[0].asExpr().asLitConstExpr().getLiteral().value != "1"){
            return 3
        }
        if (b.getLambda().getLambdaParams()[0].getIdentifier().value != "a"){
            return 4
        }
        return 0
    }
    return 4
}
