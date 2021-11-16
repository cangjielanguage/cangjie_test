// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args

from ast import ast.*

open class A {
    var x : Tokens
    init(x: Tokens) {
        this.x = x
    }
}

class B <: A {
    init(x: Tokens) {
        super(x)
    }
}


func main(){
    B(quote(1))
    return 0
}
