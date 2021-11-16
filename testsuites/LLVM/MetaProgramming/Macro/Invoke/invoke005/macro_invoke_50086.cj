// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output

import test.*

open class A{
    var a : Int64 = 1
}

class B <: A{
    init(input:Int64){
        @M(super.a) = input // EXPECTED: regex illegal left value
    }
}


func main(){
    B(1)
    return 0
}
