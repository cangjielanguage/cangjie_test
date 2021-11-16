// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(\@{0..1, 5..10:step})
    let expr = ParseExpr(input)
    if (expr.isArrayLit ()) {
        var b = expr.asArrayLit ()
        if (b.getChildren()[0].asRangeExpr().getStartExpr().asLitConstExpr().getLiteral().value != "0"){
            return 1
        }
        if (b.getChildren()[1].asRangeExpr().getStepExpr().asRefExpr().getIdentifier().value != "step"){
            return 3
        }
        return 0
    }
    return 5
}
