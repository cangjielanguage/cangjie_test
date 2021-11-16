// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC-PIPE-1: %run_macro %compiler %cmp_opt %macro_lib_opt %f %macro_debug -o %output 2>&1 | compare %f
// ASSERT: scan cannot convert a boolean literal to type 'Int64'


package use

import define.*

func main(){
@SAME @SAME @SAME @SAME @SAME @SAME @SAME @SAME @SAME @SAME @ERROR{}
0
}
