// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*


class A<T>{
    @M private var a : T
    var b : T
    init(input:T){
        a = input
        b = a
    }
}

func main(){
    return A<Int64>(0).b
}