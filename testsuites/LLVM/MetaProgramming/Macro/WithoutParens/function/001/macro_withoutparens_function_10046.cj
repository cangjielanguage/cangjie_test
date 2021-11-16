// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*

record A<T>{
    @M private func test(input:T){0}
    func foo(input:T){test(input)}
}

func main(){
    A<Int64>().foo(1)
}