// DEPENDENCE: define_var.cj
// EXEC: %compiler %cmp_opt define_var.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import define_var.*

var a = 0

@M[x] var b = 0 // ASSERT: scan redefinition of declaration 'a'

func main(){
    return 0
}