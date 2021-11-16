// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC: %run %run_opt %output  %run_args

import test.*

open class A{
    var a : Int64 = 1
}

class B <: A{
    init(){
        var b : Int64 = @M(super.a)
    }
}


func main(){
    B()
    return 0
}
