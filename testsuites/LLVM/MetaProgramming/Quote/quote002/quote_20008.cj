// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args
package define
from ast import ast.*
external macro test(input:Tokens):Tokens{
    quote(-0o7)
    quote(-0O6)
    quote(0o5)
    quote(-0o4_)
    quote(-0o3_2)
    quote(-0o1__1)
    quote(-0o3456)
    quote(-0o1_2_3_4_)
    quote(+0o123)
    quote(--0o0)
}

func main(){
    return 0
}
