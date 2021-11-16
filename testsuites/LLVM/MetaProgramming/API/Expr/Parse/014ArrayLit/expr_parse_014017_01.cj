// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(\@{\@{1,2}, \@{4,5}})
    let expr = ParseExpr(input)
    if (expr.isArrayLit ()) {
        var b = expr.asArrayLit ()
        if (b.getChildren()[0].asArrayLit ().getChildren()[0].asLitConstExpr().getLiteral().value != "1"){
            return 1
        }
        if (b.getChildren()[1].asArrayLit ().getChildren()[1].asLitConstExpr().getLiteral().value != "5"){
            return 3
        }
        return 0
    }
    return 5
}
