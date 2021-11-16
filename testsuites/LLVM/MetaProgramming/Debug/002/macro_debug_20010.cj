// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f %macro_debug -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan token_literal_value: 12345

package use

import define.*
import ast.*



func main(){
    @SAME var A = quote(12345)
    A.dump()
    return 0
}
