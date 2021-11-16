// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var tk1 = Token(TokenKind.DOT)
    var tk2 = Token(TokenKind.COMMA)
    var tk3 = Token(TokenKind.DOT)
    var res1 = tk1 == tk2
    var res2 = tk3 != tk2
    if (res1) {
        return 1
    }
    if (!res2) {
        return 2
    }
    return 0
}
