// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro test.*

func main(){
    @M['\u{f}']('\u{f}')
    @M['\u{ffffffff}']('\u{ffffffff}')
    @M['\u{12345678}']('\u{12345678}')
    @M['\u{90123456}']('\u{90123456}')
    return 0
}
