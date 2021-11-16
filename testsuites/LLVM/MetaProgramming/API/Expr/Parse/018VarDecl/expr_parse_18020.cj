// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(var a = \@{1,2,3,4})
    let expr = ParseDecl(input)
    var b = expr.asVarDecl()
    if (b.getKeyword().value != "var") {
        return 2
    }
    if (b.getIdentifier().value != "a") {
        return 3
    }
    if (b.getInitializer().asArrayLit().getChildren()[1].asLitConstExpr().getLiteral().value != "2") {
        return 4
    }
    return 0

}
