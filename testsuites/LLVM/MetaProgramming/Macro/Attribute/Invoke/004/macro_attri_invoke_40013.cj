// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro test.*

func main(){
    @M[-1e-2](-1e-2)
    @M[-.1e-1](-.1e-1)
    @M[-1.1](-1.1)
    @M[-1.1e-1](-1.1e-1)
    @M[-0xFP-1](-0xFP-1)
    @M[-0x.FP-1](-0x.FP-1)
    @M[-0xf.FP-1](-0xf.FP-1)
    return 0
}
