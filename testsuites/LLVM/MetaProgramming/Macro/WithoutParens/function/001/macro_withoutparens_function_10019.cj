// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*

open class A<T>{
    open func test(input:T){1}
}

class B<T> <: A<T>{
    @M override func test(input:T){0}
}


func main(){
    B<Int64>().test(1)
}