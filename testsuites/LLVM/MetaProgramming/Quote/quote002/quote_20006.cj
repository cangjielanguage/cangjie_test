// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

package define
from ast import ast.*
// bad case for hex literal
external macro test(input:Tokens):Tokens{
    quote(-0_x0)
    quote(0x_1) // EXPECTED: regex illegal underline in number literal
    quote(0x_) // EXPECTED: regex illegal underline in number literal
    quote(0xg) // EXPECTED: regex hexadecimal number donot has digits
    quote(00x0)
    quote(0x) // EXPECTED: regex hexadecimal number donot has digits
}

func main(){
    return 0
}
