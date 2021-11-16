// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var tkList = @{Token(), Token(TokenKind.IDENTIFIER, "foo"), Token(TokenKind.DOT)}
    var tks = Tokens(tkList)
    try {
        tks.get(3)
    } catch (e: IndexOutOfBoundsException) {
        return 0
    }
    return 1
}
