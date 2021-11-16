// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex description: identifier, token_id: 150, token_literal_value: foo, fileID: 0, line: 0, column: 0\ndescription: add, token_id: 12, token_literal_value: \+, fileID: 0, line: 0, column: 0\ndescription: identifier, token_id: 150, token_literal_value: bar, fileID: 0, line: 0, column: 0

from ast import ast.*
func main(): Int64{
    var tks = Tokens()
    tks = Token(TokenKind.IDENTIFIER, "foo") + Token(TokenKind.ADD)
    tks = tks + Token(TokenKind.IDENTIFIER, "bar")

    var itr = tks.iterator()
    while(true) {
        itr.next()
        match (itr.peek()) {
            case Some(obj) if (itr.seeing(TokenKind.END)) => break
            case Some(obj) => obj.dump()
            case _ => break
        }
    }
    return 0
}
