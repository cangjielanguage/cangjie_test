// DEPENDENCE:  define_80002.cj
// EXEC: %compiler %cmp_opt %enable_macro define_80002.cj %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro define.*

func main(){
    return @X(@Y(1)) - 6 // 1+2+1+2
}
