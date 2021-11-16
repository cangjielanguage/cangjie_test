// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
   	var input : Tokens = quote((x,y)=(a,1))
    let expr = ParseExpr(input)
    if (expr.isAssignExpr()) {
        var b = expr.asAssignExpr()
        if (b.getLeftValue().asTupleLit().getChildren()[0].asRefExpr().getIdentifier().value != "x") {
            return 1
        }
        if (b.getLeftValue().asTupleLit().getChildren()[1].asRefExpr().getIdentifier().value != "y") {
            return 2
        }
        if (b.getRightExpr().asTupleLit().getChildren()[0].asRefExpr().getIdentifier().value != "a") {
            return 3
        }
        if (b.getRightExpr().asTupleLit().getChildren()[1].asLitConstExpr().getLiteral().value != "1") {
            return 4
        }
        return 0
    }
    return 3
}
