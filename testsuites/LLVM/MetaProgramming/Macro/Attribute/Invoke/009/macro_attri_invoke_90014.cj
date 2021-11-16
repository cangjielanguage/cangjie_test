// DEPENDENCE: define_var.cj
// EXEC: %compiler %cmp_opt define_var.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import define_var.*

@M[x] var a : Bool = 0

func main(){
    return 0
}