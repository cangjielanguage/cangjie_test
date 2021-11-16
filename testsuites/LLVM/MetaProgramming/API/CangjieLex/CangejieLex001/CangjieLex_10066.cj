// DEPENDENCE:../utils.cj
// EXEC: %compiler %cmp_opt %f utils.cj %use_ast -o %output
// EXEC: %run %run_opt %output  %run_args

from ast import ast.*

func main(){
    var a : Tokens = CangjieLex("abstract")
    var b : Tokens = quote(abstract)
    return check(a,b)
}

