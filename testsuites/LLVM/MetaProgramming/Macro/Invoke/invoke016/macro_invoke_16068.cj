// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro define.*

var a = @SAME[0]{i:Int64=>i}
//var b = @SAME{i:Int64=>i}

func main(){
    return a(0)
}