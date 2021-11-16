// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*

func test<T>(input:T){
    func inside(x:T){
        @M var a : T = x
        return a
    }
    return inside(input)
}

func main(){
    return test<Int64>(0)
}