// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f %macro_debug -o %output
// EXEC: %run %run_opt %output %run_args


package use

import define.*

class A{var b : Int64 = 1}

func main(){
var a : ?A = A()
@SAME var x = a?.b
return 0
}
