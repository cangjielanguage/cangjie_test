// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input : Tokens = quote({a:Int32=>if (true) {a} else {b}})
    let expr = ParseLambdaExpr(input)
    if (expr.getLambdaParams()[0].getIdentifier().value != "a") {
        return 1
    }
    if (expr.getLambdaParams()[0].getType().asPrimitiveType().getPrimitive().value != "Int32") {
        return 2
    }
    var ifExpr = expr.getLambdaBody()[0].asExpr().asIfExpr()
    if (ifExpr.getCondExpr().asLitConstExpr().getLiteral().value != "true") {
        return 3
    }
    if (ifExpr.getIfBody()[0].asExpr().asRefExpr().getIdentifier().value != "a") {
        return 4
    }
    if (ifExpr.getElseBranch().asExpr().asBlock().getBody()[0].asExpr().asRefExpr().getIdentifier().value != "b") {
        return 5
    }
    return 0

}
