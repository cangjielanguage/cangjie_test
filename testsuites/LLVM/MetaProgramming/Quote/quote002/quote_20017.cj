// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args
package define
from ast import ast.*
external macro test(input:Tokens):Tokens{
    quote(ab)
    quote(a_b)
    quote(a1)
    quote(ab_1)
    quote(`a`)
    quote(`a1`)
    quote(`a_`)
    quote(`ab_1`)
}

func main(){
    return 0
}
