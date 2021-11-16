// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(\@{-b,!a})
    let expr = ParseExpr(input)
    if (expr.isArrayLit ()) {
        var b = expr.asArrayLit ()
        if (b.getChildren()[0].asUnaryExpr().getExpr().asRefExpr().getIdentifier().value != "b"){
            return 1
        }
        if (b.getChildren()[1].asUnaryExpr().getExpr().asRefExpr().getIdentifier().value != "a"){
            return 3
        }
        return 0
    }
    return 5
}
