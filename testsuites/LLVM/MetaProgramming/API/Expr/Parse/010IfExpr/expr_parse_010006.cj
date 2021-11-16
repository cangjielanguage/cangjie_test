// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input : Tokens = quote(if(a){1}else if(false){b} else if (x){c} else {d})
    let expr = ParseExpr(input)
    if (expr.isIfExpr()) {
        var b = expr.asIfExpr()
        if (b.getCondExpr().asRefExpr().getIdentifier().value != "a") {
            return 1
        }
        if (b.getIfBody()[0].asExpr().asLitConstExpr().getLiteral().value != "1") {
            return 2
        }
        if (b.getElseBranch().asExpr().asIfExpr().getCondExpr().asLitConstExpr().getLiteral().value != "false") {
            return 3
        }
        if (b.getElseBranch().asExpr().asIfExpr().getIfBody()[0].asExpr().asRefExpr().getIdentifier().value != "b") {
            return 4
        }

        var second = b.getElseBranch().asExpr().asIfExpr().getElseBranch().asExpr().asIfExpr()
        if (second.getElseBranch().asExpr().asBlock().getBody()[0].asExpr().asRefExpr().getIdentifier().value != "d") {
            return 5
        }
        if (second.getIfBody()[0].asExpr().asRefExpr().getIdentifier().value != "c") {
            return 6
        }
        return 0
    }
    return 10
}
