// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 

from ast import ast.*

func main() {
    var tkList = @{Token(), Token(TokenKind.IDENTIFIER, "foo"), Token(TokenKind.DOT)}
    var tks = Tokens(tkList)
    if (tks.size() != 3) {
        return 1
    }
    if (tks.get(1).value != "foo") {
        return 2
    }
    return 0
}
