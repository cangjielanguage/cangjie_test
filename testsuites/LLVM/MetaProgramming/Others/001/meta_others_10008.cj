// DEPENDENCE:  test_10008.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt test_10008.cj -o %output
// EXEC: %run %run_opt %output  %run_args

package define
from ast import ast.*

func test(){quote(0)}

external macro M(input:Tokens){
    return test()
}


