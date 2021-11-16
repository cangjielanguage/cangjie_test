// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*

interface A<T>{
    static func test<X>(input:X){
        @M var a : X = input
        return a
    }
}

class Test<T> <: A<T>{}

func main(){
    return Test<Int64>.test<Int64>(0)
}