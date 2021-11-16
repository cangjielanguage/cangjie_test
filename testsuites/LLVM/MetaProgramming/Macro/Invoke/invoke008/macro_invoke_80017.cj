// DEPENDENCE:  define_80017.cj
// EXEC: %compiler %cmp_opt %enable_macro define_80017.cj %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro define.*

func main(){
    @X[+2](@Y[1](var x =))

    return x - 3
}
