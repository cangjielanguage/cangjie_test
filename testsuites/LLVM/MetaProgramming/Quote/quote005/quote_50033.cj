// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args

from ast import ast.*

func test(a!:Tokens = quote(1)){a}

func main(){
    var a : Tokens = test()
    return 0
}
