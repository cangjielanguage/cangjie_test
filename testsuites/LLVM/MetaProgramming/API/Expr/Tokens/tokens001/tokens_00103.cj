// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args 

from ast import ast.*

func main() {
    func x(a:Int64): Token { return Token(TokenKind.IDENTIFIER, "foo") }
    var i : Int64 = 100
    var myArray : ArrayList<Token> = ArrayList<Token>(i, x)
    var tks = Tokens(myArray)
    if (tks.size() != 100) {
        return 1
    }
    if (tks.get(9).value != "foo") {
        return 2
    }
    return 0
}
