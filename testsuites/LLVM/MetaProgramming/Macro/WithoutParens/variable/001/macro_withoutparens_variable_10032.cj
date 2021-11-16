// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*

interface A<T>{
    func test(input:T){
        @M var a : T = input
        return a
    }
}

class B<T> <: A<T>{}


func main(){
    return B<Int64>().test(0)
}