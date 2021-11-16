// EXEC: %compiler %cmp_opt %use_ast %f -o %output 2>&1 | compare %f

from ast import ast.*

func main() {
    var tk = Token(TokenKind.INC, "++") // EXPECTED: regex 'INC' is not a member of enum 'TokenKind'
    return 0
}
