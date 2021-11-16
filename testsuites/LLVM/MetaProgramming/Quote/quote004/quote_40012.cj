// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

package define
from ast import ast.*

external macro test(input:Tokens):Tokens{
    +quote(1) // EXPECTED: regex invalid expression initialization
    input
}

func main(){
    return 0
}
