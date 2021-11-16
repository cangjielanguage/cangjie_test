// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output

import test.*

func main(){
    @M('\u{}')
    @M('\u{z}')
    @M('\u{ffffffffz}') // EXPECTED: regex escape unicode must be 1 to 8 hexadecimal digits in braces
    @M('\u{123456789}') // EXPECTED: regex escape unicode must be 1 to 8 hexadecimal digits in braces
    return 0
}
