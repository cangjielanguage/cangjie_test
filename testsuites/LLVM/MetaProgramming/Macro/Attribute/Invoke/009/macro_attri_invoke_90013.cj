// DEPENDENCE: define_var.cj
// EXEC: %compiler %cmp_opt define_var.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import define_var.*

@M[x] var = 0 // EXPECTED: regex expected variable pattern, tuple pattern or enum pattern after 'var'

func main(){
    return 0
}