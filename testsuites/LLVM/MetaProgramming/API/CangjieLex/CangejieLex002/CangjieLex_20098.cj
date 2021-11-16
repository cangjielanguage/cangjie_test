// DEPENDENCE:../utils.cj
// EXEC: %compiler %cmp_opt %f utils.cj %use_ast -o %output
// EXEC: %run %run_opt %output  %run_args

import ast.*

func main(){
    var i = "'\"'"
    var a : Tokens = CangjieLex(i)
    return check(a+Token(150), a)
}
