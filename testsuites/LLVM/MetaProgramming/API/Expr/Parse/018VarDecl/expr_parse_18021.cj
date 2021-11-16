// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(var a = 0..10:2)
    let expr = ParseDecl(input)
    var b = expr.asVarDecl()
    if (b.getKeyword().value != "var") {
        return 2
    }
    if (b.getIdentifier().value != "a") {
        return 3
    }
    if (b.getInitializer().asRangeExpr().getStartExpr().asLitConstExpr().getLiteral().value != "0") {
        return 4
    }
    return 0

}
