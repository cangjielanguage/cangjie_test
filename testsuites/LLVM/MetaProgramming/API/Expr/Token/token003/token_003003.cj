// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main() {
    var tk = Token(TokenKind.DOT)
    var tks: Tokens = quote("public var a = 1")
    var res: Tokens = tk + tks
    if (res.toString().trim() != ". public var a = 1") {
        return 1
    }
    return 0
}
