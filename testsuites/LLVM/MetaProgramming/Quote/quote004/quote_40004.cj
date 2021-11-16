// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

package define
from ast import ast.*

external macro test(input:Tokens):Tokens{
    quote(1+1) - quote(1+1) // EXPECTED: regex invalid binary operator '-' on type 'Class-Tokens' and 'Class-Tokens'
    input
}

func main(){
    return 0
}
