// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %macro_debug %f -o %output
// EXEC: %run %run_opt %output %run_args

import define.*
@M
func main(){
    return 0
}