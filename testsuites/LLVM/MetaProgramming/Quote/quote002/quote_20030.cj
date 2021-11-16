// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

package define
from ast import ast.*
// bad case for character type
external macro test(input:Tokens):Tokens{
    quote('\u{}') // EXPECTED: regex escape unicode must be 1 to 8 hexadecimal digits in braces
    quote('\u{z}') // EXPECTED: regex escape unicode must be 1 to 8 hexadecimal digits in braces
    quote('\u{ffffffffz}') // EXPECTED: regex escape unicode must be 1 to 8 hexadecimal digits in braces
    quote('\u{123456789}') // EXPECTED: regex escape unicode must be 1 to 8 hexadecimal digits in braces
}

func main(){
    return 0
}
