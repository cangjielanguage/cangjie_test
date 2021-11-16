// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    func x(a:Int64): Token { return Token(TokenKind.IDENTIFIER, "foo") }
    var len : Int64 = 100
    var tkList1: ArrayList<Token> = ArrayList<Token>(len, x)
    // var tkList2: Token[] = @{}

    var tks1 = Tokens(tkList1)
    // var tks2 = Tokens(tkList2)
    var tks3 = Tokens()

    if (tks1.size() != len) {
        return 1
    }
//   if (tks2.size() != 0) {
//        return 1
//    }
    if (tks3.size() != 0) {
        return 1
    }

    return 0
}
