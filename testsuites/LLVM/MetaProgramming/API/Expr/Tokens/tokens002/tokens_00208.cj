// EXEC: %compiler %cmp_opt %use_ast %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
from ast import ast.*

func main() {
    var tkList = @{Token(), Token(TokenKind.IDENTIFIER, "foo"), Token(TokenKind.DOT)}
    var tks = Tokens(tkList)
    tks = tks.concat(Token())   // EXPECTED: regex no matching function declaration for function call 'concat'
    return 0
}
