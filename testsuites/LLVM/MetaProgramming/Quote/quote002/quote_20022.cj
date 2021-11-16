// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

package define
from ast import ast.*
external macro test(input:Tokens):Tokens{
    quote('') // EXPECTED: regex empty character is not allowed
}

func main(){
    return 0
}
