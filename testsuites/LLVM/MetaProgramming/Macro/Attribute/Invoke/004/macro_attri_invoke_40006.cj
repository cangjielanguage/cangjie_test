// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import macro test.*

func main(){
    @M[-0_x0](0)
    @M[0x_1](0) // EXPECTED: regex illegal underline in number literal
    @M[0x_](0) // EXPECTED: regex illegal underline in number literal
    @M[0xg](0) // EXPECTED: regex hexadecimal number donot has digits
    @M[00x0](0)
    @M[0x](0) // EXPECTED: regex hexadecimal number donot has digits
    return 0
}
