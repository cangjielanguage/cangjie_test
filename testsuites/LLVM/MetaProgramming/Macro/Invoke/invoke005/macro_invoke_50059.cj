// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output

import test.*

func main(){
    @M(1 **& 2) // EXPECTED: regex not supported operator
    @M(1) **& 2 // EXPECTED: regex not supported operator
    1 **& @M(2) // EXPECTED: regex not supported operator
    return 0
}
