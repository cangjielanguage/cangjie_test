// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var tk = Token(TokenKind.DOT)
    if (tk.kind != TokenKind.DOT) {
        return 1
    }
    if (tk.value != ".") {
        return 1
    }
    if (tk.pos.fileID != 0) {
        return 1
    }
    if (tk.pos.line != 0) {
        return 1
    }
    if (tk.pos.column != 0) {
        return 1
    }
    return 0
}
