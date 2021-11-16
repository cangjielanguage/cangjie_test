// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*

interface A<T>{
    @M func test(input:T):Int64{1}
}

class B<T> <: A<T>{
    func test(input:T){0}
}

func main(){
    B<Int64>().test(1)
}
