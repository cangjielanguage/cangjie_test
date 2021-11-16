// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output

import test.*

class A{
    var a : Int64
    init(input:Int64){
        @M(this.a) = input // EXPECTED: regex illegal left value
    }
}


func main(){
    A(1)
    return 0
}
