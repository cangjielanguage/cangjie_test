// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(#{a(),b()})
    let expr = ParseExpr(input)
    if (expr.isSetOrMapLit()) {
        var b = expr.asSetOrMapLit()
        if (b.getElements()[0].asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "a"){
            return 1
        }
        if (b.getElements()[1].asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "b"){
            return 3
        }
        return 0
    }
    return 5
}
