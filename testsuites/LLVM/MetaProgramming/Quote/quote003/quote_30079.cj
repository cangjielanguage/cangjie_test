// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args

package define
from ast import ast.*

external macro test(input:Tokens):Tokens{
    quote(if (true) {
    }else if (false) {
    }else{})
}

func main(){
    return 0
}
