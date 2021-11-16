// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC: %run %run_opt %output  %run_args

import test.*

class A{
    var a : Int64 = 1
    func test(){
        var b : Int64 = @M(this.a)
    }
}


func main(){
    A().test()
    return 0
}
