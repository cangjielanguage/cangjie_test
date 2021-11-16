// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro define.*

class X{
    X(){
@VAR_A(@VAR_C[0](0))

@VAR_B @VAR_D[0] var x = 1

@VAR_C[0](@VAR_A(0))

@VAR_D[0]@VAR_B var x = 1
    }
}
func main(){
    0
}
