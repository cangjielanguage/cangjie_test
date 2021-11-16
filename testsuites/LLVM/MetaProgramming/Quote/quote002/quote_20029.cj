// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args
package define
from ast import ast.*
external macro test(input:Tokens):Tokens{
    quote('\u{f}')
    quote('\u{ffffffff}')
    quote('\u{12345678}')
    quote('\u{90123456}')
}

func main(){
    return 0
}
