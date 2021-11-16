// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args
package define
from ast import ast.*

external macro test(input:Tokens):Tokens{
    quote(-0b0)
    quote(-0B1)
    quote(0b1)
    quote(-0b0_)
    quote(-0b0_1)
    quote(-0b0__1)
    quote(-0b0110)
    quote(-0b0_1_1_0_)
    quote(+0b000)
    quote(--0b0)
}

func main(){
    return 0
}
