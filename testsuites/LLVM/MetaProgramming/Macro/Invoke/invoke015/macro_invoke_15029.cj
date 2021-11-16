// DEPENDENCE:  define_func.cj
// EXEC: %compiler %cmp_opt define_func.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import define_func.*

interface X{
@VAR_A(@VAR_A(0))

@VAR_B @VAR_B var x = 1

@VAR_C[0](@VAR_C[0](0))

@VAR_D[0] @VAR_D[0] var x = 1
}

func main(){
    0
}
