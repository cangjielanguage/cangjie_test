// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import macro test.*

func main(){
    var a : Int64 = 1
    @M[synchronized((a)){} ](0) // EXPECTED:regex expected Mutex object after synchronized
    return 0
}
