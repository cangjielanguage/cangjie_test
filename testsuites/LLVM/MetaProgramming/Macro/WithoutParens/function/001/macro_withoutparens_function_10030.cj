// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*

interface A<T>{
    @M static func test<X>(input:X):Int64{0}
}

class Test<T> <: A<T>{}

func main(){
    Test<Int64>.test<Int64>(1)
}