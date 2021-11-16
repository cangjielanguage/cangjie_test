// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*

external enum A<T>{a(T)}

func test(){
    @M var a : A<Int64> = A<Int64>.a(1)
}

func main(){
    test()
    return 0
}
