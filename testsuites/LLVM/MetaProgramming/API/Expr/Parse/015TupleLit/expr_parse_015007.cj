// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote((1+2,a+b))
    let expr = ParseExpr(input)
    if (expr.isTupleLit()) {
        var b = expr.asTupleLit()
        if (b.getChildren()[0].asBinaryExpr().getLeftExpr().asLitConstExpr().getLiteral().value != "1"){
            return 1
        }
        if (b.getChildren()[0].asBinaryExpr().getRightExpr().asLitConstExpr().getLiteral().value != "2"){
            return 2
        }
        if (b.getChildren()[1].asBinaryExpr().getLeftExpr().asRefExpr().getIdentifier().value != "a"){
            return 3
        }
        if (b.getChildren()[1].asBinaryExpr().getRightExpr().asRefExpr().getIdentifier().value != "b"){
            return 4
        }
        return 0
    }
    return 5
}
