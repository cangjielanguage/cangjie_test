// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex description: UIntNative, token_id: 78, token_literal_value: UIntNative, fileID: 0, line: 0, column: 0

from ast import ast.*

func main() {
    var tk = Token(TokenKind.UINTNATIVE)
    tk.dump()
    if (tk.kind != TokenKind.UINTNATIVE) {
        return 1
    }
    if (tk.value != "UIntNative") {
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