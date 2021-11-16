// DEPENDENCE:  test_40001.cj
// EXEC: %compiler %cmp_opt %enable_macro test_40001.cj %pic_opt
// EXEC-PIPE: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output | compare %f
// EXEC: %run %run_opt %output  %run_args
// ASSERT: scan test_40001.cj 9

import test.*

func main(){
    @M(flag = true)
    if (flag) {
        return 0
    }else{
        return 1
    }
}
