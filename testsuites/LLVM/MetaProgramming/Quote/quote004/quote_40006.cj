// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args

package define
from ast import ast.*

external macro test(input:Tokens):Tokens{
    match (quote(1+1)) {
        case _ => quote(1+1)
    }
    input
}

func main(){
    return 0
}
