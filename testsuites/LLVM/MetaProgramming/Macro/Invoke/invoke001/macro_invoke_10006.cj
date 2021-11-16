// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC: %run %run_opt %output  %run_args

import test.*
from ast import ast.*

func main(){
    @M(quote(flag = true)) // will not change flag value.
    if (flag) {
        return 1
    }else{
        return 0
    }
}
