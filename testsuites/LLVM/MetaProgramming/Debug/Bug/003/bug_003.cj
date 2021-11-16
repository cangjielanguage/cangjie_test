// DEPENDENCE:  test.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// EXEC: %run %compiler %cmp_opt %macro_lib_opt %macro_debug test.cj -o %output
// EXEC: %run %run_opt %output  %run_args

package define
from ast import ast.*

external macro M(input:Tokens){
    return quote(2)
}
