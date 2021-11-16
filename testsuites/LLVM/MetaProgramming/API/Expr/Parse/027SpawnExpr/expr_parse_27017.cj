// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input : Tokens = quote(spawn{=>if (true) {a} else {b}})
    let expr = ParseSpawnExpr(input)
    var b = expr.getTaskExpr().asLambdaExpr()
    var ifExpr = b.getLambdaBody()[0].asExpr().asIfExpr()
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
