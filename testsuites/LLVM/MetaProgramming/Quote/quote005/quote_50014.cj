// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args

from ast import ast.*

class A{
    var a : Tokens
    init(input: Tokens){
        this.a = input
    }
}

func main(){
    A(quote(1))
    return 0
}
