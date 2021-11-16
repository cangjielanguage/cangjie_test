// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex description: static, token_id: 132, token_literal_value: static, fileID: 0, line: 0, column: 0

from ast import ast.*

func main() {
    var tk = Token(TokenKind.STATIC)
    tk.dump()
    if (tk.kind != TokenKind.STATIC) {
        return 1
    }
    if (tk.value != "static") {
        return 2
    }
    if (tk.pos.fileID != 0) {
        return 3
    }
    if (tk.pos.line != 0) {
        return 4
    }
    if (tk.pos.column != 0) {
        return 5
    }
    return 0
}