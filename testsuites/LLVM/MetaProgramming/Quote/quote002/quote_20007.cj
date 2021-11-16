// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args
package define
from ast import ast.*
external macro test(input:Tokens):Tokens{
    quote(-0xF)
    quote(-0Xf)
    quote(0x1)
    quote(-0xa_)
    quote(-0xb_c)
    quote(-0x0__1)
    quote(-0x5678)
    quote(-0xd_e_f_9_)
    quote(+0x123)
    quote(--0x0)
}

func main(){
    return 0
}
