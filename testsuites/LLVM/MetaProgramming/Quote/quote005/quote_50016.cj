// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args

from ast import ast.*

func main(){
    Option<Tokens>.Some(quote(1))
    var a = Some<Tokens>(quote(1))
    return 0
}
