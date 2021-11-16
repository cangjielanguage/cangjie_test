// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*

external interface A<T>{}
external class B<T> <: A<T>{}

func test(){
    @M var a : A<Int64> = B<Int64>()
}

func main(){
    test()
    return 0
}
