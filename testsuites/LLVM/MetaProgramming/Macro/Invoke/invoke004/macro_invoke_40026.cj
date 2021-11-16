// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC-PIPE-1: %run_macro %compiler %cmp_opt %macro_lib_opt %f  2>&1 | compare %f
// ASSERT: scan expected ')'

import test.*

func main(){
    @M(''()
    return 0
}
