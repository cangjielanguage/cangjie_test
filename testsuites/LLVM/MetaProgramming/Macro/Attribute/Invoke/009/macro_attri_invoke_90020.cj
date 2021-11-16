// DEPENDENCE: define_class.cj
// EXEC: %compiler %cmp_opt define_class.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import define_class.*

@M[x] class A{}

class B <: A{} // EXPECTED: regex super class 'A' is not inheritable, use 'open' modifier instead

func main(){
    return 0
}