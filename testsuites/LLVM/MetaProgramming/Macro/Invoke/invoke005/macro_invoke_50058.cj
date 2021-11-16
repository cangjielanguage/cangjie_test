// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC: %run %run_opt %output  %run_args

import test.*

func main(){
    @M(1 ** 2)
    @M(1) ** 2
    1 ** @M(2)
    return 0
}
