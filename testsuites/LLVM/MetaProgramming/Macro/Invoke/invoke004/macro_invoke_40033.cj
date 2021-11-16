// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC-PIPE-1: %run_macro %compiler %cmp_opt %macro_lib_opt %f  2>&1 | compare %f

import test.*

func main(){
    @M(")a"
    return 0
}
// EXPECTED: regex expected '\)'
