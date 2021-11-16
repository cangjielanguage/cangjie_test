// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC: %run %run_opt %output  %run_args

import test.*

func main(){
    @M(-0o7)
    @M(-0O6)
    @M(0o5)
    @M(-0o4_)
    @M(-0o3_2)
    @M(-0o1__1)
    @M(-0o3456)
    @M(-0o1_2_3_4_)
    @M(+0o123)
    @M(--0o0)
    return 0
}
