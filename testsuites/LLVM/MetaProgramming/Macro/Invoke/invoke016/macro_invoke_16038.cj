// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro define.*

func main(){
    var a = @SAME{1}() / @SAME{1}()
    var b = @SAME[0]{1}() / @SAME[0]{1}()
    if ((a == b) && (a == 1))
    {
        return 0
    }
    else
    {
        return 1
    }
}
