// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro define.*
from ast import ast.*

func main(){
    quote($(@SAME{1}()))
    quote($(@SAME[0]{1}()))
    return 0
}