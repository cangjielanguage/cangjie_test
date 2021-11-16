// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

package define
from ast import ast.*
// bad case for octal literal
external macro test(input:Tokens):Tokens{
    quote(-0_o0)
    quote(0o_1)  // EXPECTED: regex illegal underline in number literal
    quote(0o_)  // EXPECTED: regex illegal underline in number literal
    quote(0o8)  // EXPECTED: regex invalid digit '8' in octal number
    quote(0oa)  // EXPECTED: regex octal number donot has digits
    quote(00o0)
    quote(0o)  // EXPECTED: regex octal number donot has digits
}

func main(){
    return 0
}
