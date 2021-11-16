// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro test.*

func main(){
    @M[-0b0](-0b0)
    @M[-0B1](-0B1)
    @M[0b1](0b1)
    @M[-0b0_](-0b0_)
    @M[-0b0_1](-0b0_1)
    @M[-0b0__1](-0b0__1)
    @M[-0b0110](-0b0110)
    @M[-0b0_1_1_0_](-0b0_1_1_0_)
    @M[+0b000](+0b000)
    @M[--0b0](--0b0)
    return 0
}
