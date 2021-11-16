// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*

record A<T>{
    @M static func test<X>(input:X){0}
}

func main(){
    A<Int64>.test<Int64>(1)
}