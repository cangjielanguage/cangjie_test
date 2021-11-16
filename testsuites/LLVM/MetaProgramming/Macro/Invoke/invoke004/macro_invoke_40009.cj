// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC: %run %run_opt %output  %run_args

import test.*

func main(){
    @M(-0)
    @M(0)
    @M(123456789)
    @M(4_)
    @M(3_2)
    @M(1__1)
    @M(3456)
    @M(1_2_3_4_)
    @M(+0)
    @M(--0)
    return 0
}
