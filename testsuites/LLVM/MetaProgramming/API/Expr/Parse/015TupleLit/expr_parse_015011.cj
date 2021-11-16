// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote((return a,return b))
    let expr = ParseExpr(input)
    if (expr.isTupleLit()) {
        var b = expr.asTupleLit()
        if (b.getChildren()[0].asReturnExpr().getExpr().asRefExpr().getIdentifier().value != "a"){
            return 1
        }
        if (b.getChildren()[1].asReturnExpr().getExpr().asRefExpr().getIdentifier().value != "b"){
            return 3
        }
        return 0
    }
    return 5
}
