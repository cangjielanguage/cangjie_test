// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f %macro_debug %append_opt
// ASSERT: regex-auto macro still exists in

package use

import define.*
import ast.*


external macro M2(a:Tokens){
    @SAME{}
    return 0
}