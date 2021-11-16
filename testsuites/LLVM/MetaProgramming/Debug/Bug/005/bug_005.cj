// DEPENDENCE:  define_005.cj
// EXEC: %compiler %cmp_opt define_005.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f %macro_debug -o %output
// EXEC: %run %run_opt %output  %run_args

import macro test.*

var a = {  => @M[0]{}}

func main(){
    return a()
}
