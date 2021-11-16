// DEPENDENCE:  test_40002.cj
// EXEC: %compiler %cmp_opt %enable_macro test_40002.cj %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output  %run_args | compare %f
// ASSERT: scan fileline_40002.cj 12

import test.*

func main(){
    @M
    var x = sourceFile()
    @M
    var y = sourceLine()

    print("${x} ${y}")
    return 0
}
