// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro define.*

foreign{
@VAR_A(@VAR_B var x = 1)

@VAR_B @VAR_C[0](0)

@VAR_C[0](@VAR_D[0] var x = 1)

@VAR_D[0]@VAR_A(0)
}

func main(){
    0
}
