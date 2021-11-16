// DEPENDENCE: define_class.cj
// EXEC: %compiler %cmp_opt define_class.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import define_class.*

class A{}
@M[x] class B{} // EXPECTED: regex redefinition of declaration 'A'

func main(){
    return 0
}