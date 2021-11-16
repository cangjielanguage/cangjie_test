// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f %macro_debug -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*

@M
func main(){
   var x = Some<Int64>(0)
   var b : Int64 = 1
   var a = x??b  
   return a
}
