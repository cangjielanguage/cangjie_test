// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro define.*


func main(){
    var a = @SAME[0]{i:Int64=>@SAME{i:Int64=>0}}
    return a(0)(0)
}