// EXEC: %compiler %cmp_opt %use_ast %f -o %output 2>&1 | compare %f

from ast import ast.*

func main() {
    var tk = Token(TokenKind.DOT)
    var tks: Tokens = quote("public var a = 1")
    var res: Tokens = tk + 1    // EXPECTED: regex cannot convert an integer literal to type 'Class-Tokens'
    return 0
}
