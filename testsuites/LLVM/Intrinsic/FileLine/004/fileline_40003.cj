// DEPENDENCE:  test_40003.cj
// EXEC: %compiler %cmp_opt %enable_macro test_40003.cj %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output  %run_args | compare %f
// ASSERT: scan fileline_40003.cj 12

import test.*

func main(){
    @M[var x = sourceFile()]
    var x = 1
    @M[var y = sourceLine()]
    var y = 2

    print("${x} ${y}")
    return 0
}
