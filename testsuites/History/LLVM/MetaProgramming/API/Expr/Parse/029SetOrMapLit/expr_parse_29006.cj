// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(#{1,2,3})
    let expr = ParseSetOrMapLit(input)
    if (expr.getElements()[0].asLitConstExpr().getLiteral().value != "1"){
        return 1
    }
    if (expr.getElements()[1].asLitConstExpr().getLiteral().value != "2"){
        return 2
    }
    if (expr.getElements()[2].asLitConstExpr().getLiteral().value != "3"){
        return 3
    }
    return 0
}
