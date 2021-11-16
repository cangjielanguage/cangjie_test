// DEPENDENCE:  test_10013.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt test_10013.cj -o %output
// EXEC: %run %run_opt %output  %run_args

package define
from ast import ast.*

enum A{a}

external macro M(input:Tokens){
    var a = A.a
    return quote(0)
}


