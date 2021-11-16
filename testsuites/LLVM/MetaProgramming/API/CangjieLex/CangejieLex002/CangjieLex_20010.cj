// DEPENDENCE:../utils.cj
// EXEC: %compiler %cmp_opt %f utils.cj %use_ast -o %output
// EXEC: %run %run_opt %output  %run_args

import ast.*

func main(){
    var i = "-0b0_1_1_0_"
    var a : Tokens = CangjieLex(i)
    return check(a+Token(150), a)
}
