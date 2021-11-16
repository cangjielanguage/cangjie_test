// DEPENDENCE:  define_80004.cj
// EXEC: %compiler %cmp_opt %enable_macro define_80004.cj %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro define.*

func main(){
    @X
    var x = @X(1) // 1+1+1
    return x - 3
}
