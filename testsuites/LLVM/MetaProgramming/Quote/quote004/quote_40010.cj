// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args

package define
from ast import ast.*

external macro test(input:Tokens):Tokens{
    if (true) { quote(1) } else if (true) {quote(2)}else{quote(3)}
    input
}

func main(){
    return 0
}
