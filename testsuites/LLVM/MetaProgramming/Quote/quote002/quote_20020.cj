// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

package define
from ast import ast.*
external macro test(input:Tokens):Tokens{
    quote($a) // EXPECTED: regex undeclared identifier 'a'
}

func main(){
    return 0
}
