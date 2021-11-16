// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main() {
    var input: Tokens = quote(public var a: Int32)
    let expr = ParseDecl(input)
    var b = expr.asVarDecl()
    if (b.getModifiers().toString().trim() != "public") {
        return 1
    }
    if (b.getKeyword().value != "var") {
        return 2
    }
    if (b.getIdentifier().value != "a") {
        return 3
    }
    return 0

}
