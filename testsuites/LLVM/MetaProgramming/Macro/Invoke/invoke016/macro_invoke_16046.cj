// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro define.*

func main(){
    while (@SAME{false}())
    {
        return 1
    }
    while (@SAME[0]{false}())
    {
        return 2
    }
    return 0
}
