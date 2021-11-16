// DEPENDENCE:  test_10001.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt test_10001.cj -o %output
// EXEC: %run %run_opt %output  %run_args


package define
from ast import ast.*

external macro M0(input:Tokens){
    return quote(0)
}

external macro M1(input:Tokens){
    return quote(1)
}


