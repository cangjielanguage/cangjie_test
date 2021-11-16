// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output

import test.*

func main(){
    @M(-0_x0)
    @M(0x_1) // EXPECTED: regex illegal underline in number literal
    @M(0x_) // EXPECTED: regex illegal underline in number literal
    @M(0xg) // EXPECTED: regex hexadecimal number donot has digits
    @M(00x0)
    @M(0x) // EXPECTED: regex hexadecimal number donot has digits
    return 0
}
