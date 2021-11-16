// DEPENDENCE: define_class.cj
// EXEC: %compiler %cmp_opt define_class.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import define_class.*

@M[x] class A<T>{}

func main(){
    A<Int64>() // EXPECTED: regex type argument's number does not match type parameter's number
    return 0
}