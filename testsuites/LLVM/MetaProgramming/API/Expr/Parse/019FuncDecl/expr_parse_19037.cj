// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main() {
    var input: Tokens = quote(public static func foo():Int64 {})
    let expr = ParseFuncDecl(input)
    if (expr.getModifiers().toString().trim() != "static public") {
        return 1
    }
    if (expr.getParamList().getParams().size() != 0) {
        return 21
    }
    if (expr.getIdentifier().value != "foo") {
        return 3
    }
    if (expr.getBody().size() != 0) {
        return 4
    }
    return 0

}
