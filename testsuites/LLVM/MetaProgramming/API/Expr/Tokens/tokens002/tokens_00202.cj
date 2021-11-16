// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    func x(a:Int64): Token { return Token(TokenKind.IDENTIFIER, "foo") }
    var len:Int64 = 9223372036854775807
    try {
        var tkList1: ArrayList<Token> = ArrayList<Token>(len, x)
        var tks1 = Tokens(tkList1)
        if (tks1.size() != len) {
            return 1
        }
        return 0
    } catch (e:OutOfMemoryError) {
        print("OutOfMemory, exit with 0")
        return 0
    }
}
