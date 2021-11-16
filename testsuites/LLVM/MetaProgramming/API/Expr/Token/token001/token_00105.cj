// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    try {
        var tk = Token(TokenKind.DOT, ",")
    } catch (_) {
        return 0
    }
    return 1
}
