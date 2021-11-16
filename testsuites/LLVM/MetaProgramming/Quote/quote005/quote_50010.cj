// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args

from ast import ast.*

func main(){
    var a : Tokens*Tokens = (quote(1),quote(2))
    var b : Tokens*Tokens = (quote((1,2)),quote(Bool))
    var c : Tokens*Tokens = (quote((quote(1),quote(2))),quote(2))
    return 0
}
