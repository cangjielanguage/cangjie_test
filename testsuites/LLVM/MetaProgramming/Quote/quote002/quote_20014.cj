// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

package define
from ast import ast.*
// bad case for float literal
external macro test(input:Tokens):Tokens{
    quote(-0xF.FE+1) // EXPECTED: regex hexadecimal float number must have exponent part
}

func main(){
    return 0
}
