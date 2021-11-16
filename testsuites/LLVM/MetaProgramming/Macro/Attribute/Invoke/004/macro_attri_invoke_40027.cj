// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// ASSERT: scan empty character is not allowed

import macro test.*

func main(){
    @M[[''](0)
    return 0
}
