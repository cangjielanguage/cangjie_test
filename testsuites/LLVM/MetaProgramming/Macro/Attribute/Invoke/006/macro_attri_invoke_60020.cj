// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args | compare %f
// ASSERT: scan result is 2

import macro test.*

func main(){
    var a = @M[1](+1)
    print("result is ${a}")
    return 0
}
