// DEPENDENCE:  test_10012.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt test_10012.cj -o %output
// EXEC: %run %run_opt %output  %run_args
package define
from ast import ast.*

record A{}

external macro M(input:Tokens){
    var a = A()
    return quote(0)
}


