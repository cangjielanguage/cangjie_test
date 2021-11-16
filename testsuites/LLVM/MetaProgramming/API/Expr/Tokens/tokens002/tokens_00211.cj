// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var tkList = @{Token(), Token(TokenKind.IDENTIFIER, "foo"), Token(TokenKind.DOT)}
    var tks = Tokens(tkList)
    tks = tks.concat(Token(TokenKind.COMMA) + Token(TokenKind.LSQUARE))
    if (tks.size() != 5) {
        return 1
    }
    if (tks.get(tks.size() - 1).value != "[") {
        return 2
    }
    if (tks.get(tks.size() - 2).value != ",") {
        return 2
    }
    return 0
}
