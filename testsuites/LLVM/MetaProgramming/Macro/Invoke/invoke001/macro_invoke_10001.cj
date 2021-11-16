// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt %enable_macro test.cj %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC: %run %run_opt %output  %run_args

import test.*

func main(){
    @M(flag = true) // will make flag be true while compiling.
    if (flag) {
        return 0
    }else{
        return 1
    }
}
