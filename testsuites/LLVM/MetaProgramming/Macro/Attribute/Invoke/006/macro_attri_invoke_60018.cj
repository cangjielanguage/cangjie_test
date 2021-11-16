// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args | compare %f
// ASSERT: scan @M[result is ](1)

import macro test.*

func main(){
    var a : Int64 = 1
    print("@M[result is ](${a})") // normal string, not macro call.
    return 0
}
