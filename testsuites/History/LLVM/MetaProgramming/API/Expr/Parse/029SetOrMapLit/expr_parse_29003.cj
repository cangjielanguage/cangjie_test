// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(#{1,2,3})
    let expr = ParseExpr(input)
    if (expr.isSetOrMapLit()) {
        var b = expr.asSetOrMapLit()
        if (b.getElements()[0].asLitConstExpr().getLiteral().value != "1"){
            return 1
        }
        if (b.getElements()[1].asLitConstExpr().getLiteral().value != "2"){
            return 2
        }
        if (b.getElements()[2].asLitConstExpr().getLiteral().value != "3"){
            return 3
        }
        return 0
    }
    return 4
}
