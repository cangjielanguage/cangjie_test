// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f %macro_debug -o %output
// EXEC: %run %run_opt %output %run_args


package use

import define.*

func main(){
let a : ?Array<Int64> = Array<Int64>([1,2,3])
@SAME {a?[0] = 1}
@SAME var x = a?[0]
return 0
}
