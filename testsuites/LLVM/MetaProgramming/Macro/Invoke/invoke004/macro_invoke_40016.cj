// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output

import test.*

func main(){
    @M(None)<Int64> // EXPECTED: regex expected expression here
    @M(Some)<Int64>(1) // EXPECTED: regex expected expression here
    return 0
}
