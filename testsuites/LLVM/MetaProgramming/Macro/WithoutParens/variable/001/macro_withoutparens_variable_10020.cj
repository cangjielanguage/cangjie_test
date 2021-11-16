// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*


class A<T>{
    @M public var a : T
    init(input:T){
        a = input
    }
}

func main(){
    return A<Int64>(0).a
}