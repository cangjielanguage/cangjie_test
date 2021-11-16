// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote((a,b,c))
    let expr = ParseExpr(input)
    if (expr.isTupleLit()) {
        var b = expr.asTupleLit()
        if (b.getChildren()[0].asRefExpr().getIdentifier().value != "a"){
            return 1
        }
        if (b.getChildren()[1].asRefExpr().getIdentifier().value != "b"){
            return 2
        }
        if (b.getChildren()[2].asRefExpr().getIdentifier().value != "c"){
            return 3
        }
        return 0
    }
    return 4
}
