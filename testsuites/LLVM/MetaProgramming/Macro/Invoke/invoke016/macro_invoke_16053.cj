// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro define.*


open class A{
    var a : Int64 = 0
}

class B <: A{
    func test(){
        @SAME{super.a}()
    }

}


func main(){
    return B().test()
}
