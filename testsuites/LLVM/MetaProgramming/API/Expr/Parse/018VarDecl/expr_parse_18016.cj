// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(var a = if(true) {b} else {c})
    let expr = ParseDecl(input)
    var b = expr.asVarDecl()
    if (b.getKeyword().value != "var") {
        return 2
    }
    if (b.getIdentifier().value != "a") {
        return 3
    }
    if (b.getInitializer().asIfExpr().getIfBody()[0].asExpr().asRefExpr().getIdentifier().value != "b") {
        return 4
    }
    return 0

}
