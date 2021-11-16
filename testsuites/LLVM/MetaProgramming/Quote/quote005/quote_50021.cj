// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args

from ast import ast.*

func main(){
    var a : Tokens = if (true) {
        quote(1)
    } else if (true) {
        quote(2)
    } else {
        quote(3)
    }
    return 0
}
