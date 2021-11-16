// EXEC: %compiler %cmp_opt %use_ast %f -o %output 2>&1| compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

from ast import ast.*

func main() {
    var tkList = @{Token(), Token(TokenKind.IDENTIFIER, "foo"), Token(TokenKind.DOT)}
    var tks = Tokens(tkList)
    tks = tks + 1   // EXPECTED: regex-auto invalid binary operator '+' on type 'Class-Tokens' and 'Int'
    return 0
}
