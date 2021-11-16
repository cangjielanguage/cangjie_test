// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args
package define
from ast import ast.*
external macro test(input:Tokens):Tokens{
    quote(-0)
    quote(0)
    quote(123456789)
    quote(4_)
    quote(3_2)
    quote(1__1)
    quote(3456)
    quote(1_2_3_4_)
    quote(+0)
    quote(--0)
}

func main(){
    return 0
}
