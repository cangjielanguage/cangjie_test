// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote([if (true) {a}, if (false) {b} else {c}, *if (false) {b} else {c}])
    let expr = ParseExpr(input)
    if (expr.isListLit()) {
        var b = expr.asListLit()
        if (b.getChildren()[0].asIfExpr().getCondExpr().asLitConstExpr().getLiteral().value != "true"){
            return 1
        }
        if (b.getChildren()[0].asIfExpr().getIfBody()[0].asExpr().asRefExpr().getIdentifier().value != "a"){
            return 2
        }
        if (b.getChildren()[1].asIfExpr().getElseBranch().asExpr().asBlock().getBody()[0].asExpr().asRefExpr().getIdentifier().value != "c"){
            return 3
        }
        if (b.getChildren()[2].asListSpreadExpr().getChild().asIfExpr().getIfBody()[0].asExpr().asRefExpr().getIdentifier().value != "b"){
            return 4
        }
        return 0
    }
    return 5
}
