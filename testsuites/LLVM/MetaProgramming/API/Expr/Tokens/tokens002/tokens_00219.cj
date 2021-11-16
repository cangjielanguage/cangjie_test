// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex description: identifier, token_id: 150, token_literal_value: foo

from ast import ast.*
func main(): Int64{
    var tks = Tokens()
    tks = Token(TokenKind.IDENTIFIER, "foo") + Token(TokenKind.END) + Token(TokenKind.IDENTIFIER, "bar")
    var itr = tks.iterator()
    while(true) {
        match (itr.next()) {
            case Some(obj) if (obj.kind == TokenKind.END) => break
            case Some(obj) => obj.dump()
            case _ => break
        }
    }
    return 0
}
