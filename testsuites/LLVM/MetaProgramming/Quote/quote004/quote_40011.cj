// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args

package define
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var a : Tokens
    a = quote(1+2)
    input
}

func main(){
    return 0
}
