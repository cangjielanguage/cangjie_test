// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*

@M
open class A{}

class B <: A{}

@M
open class C<T>{}

class D<T> <: C<T>{}

func main(){
    B()
    D<Int64>()
    return 0
}