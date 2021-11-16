// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args

from ast import ast.*

enum E{e(Tokens)}

func main(){
    e(quote(1))
    return 0
}
