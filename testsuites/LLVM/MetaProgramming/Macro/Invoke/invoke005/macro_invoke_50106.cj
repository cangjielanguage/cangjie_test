// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output

import test.*

func main(){
    var b : UInt32 = ord(@M('1)') // EXPECTED: regex-auto too many characters between ''
    var a : UInt32 = ord('@M(1')) // EXPECTED: regex-auto too many characters between ''
    var c : UInt32 = ord('@M(1)')
    return 0
}
