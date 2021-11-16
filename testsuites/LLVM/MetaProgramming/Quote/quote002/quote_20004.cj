// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

package define
from ast import ast.*
// bad case for binary literal
external macro test(input:Tokens):Tokens{
    quote(-0_b0)
    quote(0b_1) // EXPECTED: regex illegal underline in number literal
    quote(0b_)  // EXPECTED: regex illegal underline in number literal
    quote(0b2)  // EXPECTED: regex invalid digit '2' in binary number
    quote(0ba)  // EXPECTED: regex binary number donot has digits
    quote(00b0)
    quote(0b)  // EXPECTED: regex binary number donot has digits
}

func main(){
    return 0
}
