// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main() {
    var tk1 = Token(TokenKind.DOT)
    var tk2 = Token(TokenKind.COMMA)
    var tk3 = Token(TokenKind.DOT)
    var tks: Tokens = tk1 + tk2 + tk3
    if (tks.toString().trim() != ". , .") {
        return 1
    }
    return 0
}
