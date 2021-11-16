// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 

from ast import ast.*

func main() {
    var myArray = ArrayList<Token>([Token(), Token(TokenKind.IDENTIFIER, "foo"), Token(TokenKind.DOT)])
    var tks = Tokens(myArray)
    if (tks.size() != 3) {
        return 1
    }
    if (tks.get(0).value != "") {
        return 2
    }
    if (tks.get(1).value != "foo") {
        return 3
    }
    if (tks.get(2).value != ".") {
        return 4
    }
    return 0
}
