// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f %macro_debug -o %output
// ASSERT: scan initialization expression of Nothing type is not supported currently


package use

import define.*


func main(){
@SAME var x = return
}
