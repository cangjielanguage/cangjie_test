// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f %macro_debug -o %output
// EXEC: %run %run_opt %output %run_args


package use

import define.*

class A{
    operator func ()(x:Int64){}
}

func main(){
    var x = A()
    @SAME var b = x(1)
    return 0
}
