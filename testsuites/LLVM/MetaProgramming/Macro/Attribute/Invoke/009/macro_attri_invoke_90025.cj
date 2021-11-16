// DEPENDENCE: define_class.cj
// EXEC: %compiler %cmp_opt define_class.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import define_class.*

@M[x] class A<T> where T<:Int64{}

func main(){
    return 0
}