// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote([(1,2), (4,5)])
    let expr = ParseExpr(input)
    if (expr.isListLit()) {
        var b = expr.asListLit()
        if (b.getChildren()[0].asTupleLit().getChildren()[0].asLitConstExpr().getLiteral().value != "1"){
            return 1
        }
        if (b.getChildren()[1].asTupleLit().getChildren()[1].asLitConstExpr().getLiteral().value != "5"){
            return 3
        }
        return 0
    }
    return 5
}
