// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input : Tokens = quote(if(a){1}else {2})
    let expr = ParseIfExpr(input)
    if (expr.getCondExpr().asRefExpr().getIdentifier().value != "a") {
        return 1
    }
    if (expr.getIfBody()[0].asExpr().asLitConstExpr().getLiteral().value != "1") {
        return 2
    }
    if (expr.getElseBranch().asExpr().asBlock().getBody()[0].asExpr().asLitConstExpr().getLiteral().value != "2") {
        return 3
    }
    return 0
}
