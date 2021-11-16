// DEPENDENCE: define_01106.cj
// EXEC: %compiler %cmp_opt define_01106.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output
// ASSERT: scan-not Segmentation fault

import define_01106.*

func main(){
    var a = 2
    X = Y  // EXPECTED: regex undeclared identifier 'X'
    Y = X  // EXPECTED: regex undeclared identifier 'Y'
    return a
}


