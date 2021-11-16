// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro define.*

@SAME[0]
record A<T>{
    var a : (Int64)->Int64 = @SAME[0]{i:Int64=>i}
}

func main(){
    return 0
}