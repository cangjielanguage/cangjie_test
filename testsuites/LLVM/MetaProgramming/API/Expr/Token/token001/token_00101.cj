// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex description: illegal, token_id: 165, token_literal_value: , fileID: 0, line: 0, column: 0

from ast import ast.*

func main() {
    var tk = Token()
    tk.dump()
    if (tk.kind != TokenKind.ILLEGAL) {
        return 1
    }
    return 0
}
