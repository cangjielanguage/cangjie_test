// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args
package define
from ast import ast.*
// bad case for decimal literal
external macro test(input:Tokens):Tokens{
    quote(_1)
    quote(1a)
}

func main(){
    return 0
}
