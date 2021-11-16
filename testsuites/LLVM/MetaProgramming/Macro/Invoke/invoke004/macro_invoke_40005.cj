// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output

import test.*

func main(){
    @M(-0_o0)
    @M(0o_1) // EXPECTED: regex illegal underline in number literal
    @M(0o_) // EXPECTED: regex illegal underline in number literal
    @M(0o8) // EXPECTED: regex invalid digit '8' in octal number
    @M(0oa) // EXPECTED: regex octal number donot has digits
    @M(00o0)
    @M(0o) // EXPECTED: regex octal number donot has digits
    return 0
}
