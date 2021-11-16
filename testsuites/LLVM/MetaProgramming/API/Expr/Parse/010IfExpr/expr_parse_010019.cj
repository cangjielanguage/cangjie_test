// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input : Tokens = quote(
        if (false) {
            {x:X,y:Y=>x}
        } else {
            {x:X,y:Y=>a}
        }
    )
    let expr = ParseExpr(input)
    if (expr.isIfExpr()) {
        var b = expr.asIfExpr()
        if (b.getCondExpr().asLitConstExpr().getLiteral().value != "false") {
            return 1
        }
        if (b.getIfBody()[0].asExpr().asLambdaExpr().getLambdaParams().size() != 2) {
            return 2
        }
        if (b.getElseBranch().asExpr().asBlock().getBody()[0].asExpr().asLambdaExpr().getLambdaBody()[0].asExpr().asRefExpr().getIdentifier().value != "a") {
            return 3
        }

        return 0
    }
    return 4
}
