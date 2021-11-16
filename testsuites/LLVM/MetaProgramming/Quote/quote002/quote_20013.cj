// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args
package define
from ast import ast.*
external macro test(input:Tokens):Tokens{
    quote(-1e-2)
    quote(-.1e-1)
    quote(-1.1)
    quote(-1.1e-1)
    quote(-0xFP-1)
    quote(-0x.FP-1)
    quote(-0xf.FP-1)
}

func main(){
    return 0
}
