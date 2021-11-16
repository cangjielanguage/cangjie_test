// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output


import test.*

func main(){
    @M(-0xF.FE+1) // EXPECTED: regex hexadecimal float number must have exponent part
    return 0
}
