// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro test.*

func main(){
    @M[-0xF](-0xF)
    @M[-0Xf](-0Xf)
    @M[0x1](0x1)
    @M[-0xa_](-0xa_)
    @M[-0xb_c](-0xb_c)
    @M[-0x0__1](-0x0__1)
    @M[-0x5678](-0x5678)
    @M[-0xd_e_f_9_](-0xd_e_f_9_)
    @M[+0x123](+0x123)
    @M[--0x0](--0x0)
    return 0
}
