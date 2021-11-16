// DEPENDENCE: define_01104.cj
// EXEC: %compiler %cmp_opt define_01104.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

import define_01104.*

func main(){
    var a = 2
    @M[a](=1)
    @M(a=0)
    return a
}

