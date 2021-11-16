// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex description: Float64, token_id: 81, token_literal_value: Float64, fileID: 0, line: 0, column: 0

from ast import ast.*

func main() {
    var tk = Token(TokenKind.FLOAT64)
    tk.dump()
    if (tk.kind != TokenKind.FLOAT64) {
        return 1
    }
    if (tk.value != "Float64") {
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