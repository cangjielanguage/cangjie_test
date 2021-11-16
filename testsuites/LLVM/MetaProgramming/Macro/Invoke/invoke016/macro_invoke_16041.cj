// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro define.*

func main(){
    var a = @SAME{[1]}()[0]
    var b = @SAME[0]{[1]}()[0]
    if ((a == b) && (a == 1))
    {
        return 0
    }
    else
    {
        return 1
    }
}
