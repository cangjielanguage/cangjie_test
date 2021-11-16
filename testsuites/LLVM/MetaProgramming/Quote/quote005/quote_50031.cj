// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args

from ast import ast.*

func test(input:Tokens){}

func main(){
    test(quote(1))
    return 0
}
