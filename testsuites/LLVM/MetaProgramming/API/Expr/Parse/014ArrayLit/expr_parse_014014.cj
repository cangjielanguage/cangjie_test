// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(\@{if (true) {a}, if (false) {b} else {c}})
    let expr = ParseExpr(input)
    if (expr.isArrayLit ()) {
        var b = expr.asArrayLit ()
        if (b.getChildren()[0].asIfExpr().getCondExpr().asLitConstExpr().getLiteral().value != "true"){
            return 1
        }
        if (b.getChildren()[0].asIfExpr().getIfBody()[0].asExpr().asRefExpr().getIdentifier().value != "a"){
            return 1
        }
        if (b.getChildren()[1].asIfExpr().getElseBranch().asExpr().asBlock().getBody()[0].asExpr().asRefExpr().getIdentifier().value != "c"){
            return 3
        }
        return 0
    }
    return 5
}
