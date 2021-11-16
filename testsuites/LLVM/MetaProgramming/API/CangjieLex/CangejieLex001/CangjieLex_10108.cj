// DEPENDENCE:../utils.cj
// EXEC: %compiler %cmp_opt %f utils.cj %use_ast -o %output
// EXEC: %run %run_opt %output  %run_args

from ast import ast.*

func main(){
    var a : Tokens = CangjieLex("operator")
    var b : Tokens = quote(operator)
    return check(a,b)
}

