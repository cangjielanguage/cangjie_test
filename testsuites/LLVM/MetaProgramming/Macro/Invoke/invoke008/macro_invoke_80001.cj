// DEPENDENCE:  define_80001.cj
// EXEC: %compiler %cmp_opt %enable_macro define_80001.cj %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output | compare %f
// ASSERT: scan hello macro
// EXEC: %run %run_opt %output  %run_args

import macro define.*

func main(){
    return @M(@M(1)) - 4
}
