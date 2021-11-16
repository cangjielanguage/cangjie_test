// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main() {
    var input: Tokens = quote(public let a = 1)
    let expr = ParseDecl(input)
    var b = expr.asVarDecl()
    if (b.getModifiers().toString().trim() != "public") {
        return 1
    }
    if (b.getKeyword().value != "let") {
        return 2
    }
    if (b.getIdentifier().value != "a") {
        return 3
    }
    if (b.getInitializer().asLitConstExpr().getLiteral().value != "1") {
        return 4
    }
    return 0

}
