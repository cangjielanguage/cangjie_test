// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import macro test.*

func main(){
    @M[-0_o0](0)
    @M[0o_1](0) // EXPECTED: regex illegal underline in number literal
    @M[0o_](0) // EXPECTED: regex illegal underline in number literal
    @M[0o8](0) // EXPECTED: regex invalid digit '8' in octal number
    @M[0oa](0) // EXPECTED: regex octal number donot has digits
    @M[00o0](0)
    @M[0o](0) // EXPECTED: regex octal number donot has digits
    return 0
}
