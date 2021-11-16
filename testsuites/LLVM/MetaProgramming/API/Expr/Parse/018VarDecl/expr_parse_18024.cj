// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main() {
    var input: Tokens = quote(public var a: Int32 = 1)
    let expr = ParseVarDecl(input)
    if (expr.getModifiers().toString().trim() != "public") {
        return 1
    }
    if (expr.getKeyword().value != "var") {
        return 2
    }
    if (expr.getIdentifier().value != "a") {
        return 3
    }
    if (expr.getInitializer().asLitConstExpr().getLiteral().value != "1") {
        return 4
    }
    return 0

}
