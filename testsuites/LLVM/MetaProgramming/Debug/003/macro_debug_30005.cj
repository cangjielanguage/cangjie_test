// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f %macro_debug -o %output
// ASSERT: scan 17 | func main(x:Float32){


package use

import define.*


@SAME
var a = if (true){}
func main(x:Float32){
0
}
