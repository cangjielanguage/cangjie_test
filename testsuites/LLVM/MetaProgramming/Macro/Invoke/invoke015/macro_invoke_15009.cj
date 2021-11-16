// DEPENDENCE:  return_one.cj
// EXEC: %compiler %cmp_opt return_one.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro return_one.*

var a = @VAR_A(@VAR_A(0))

var b = @VAR_B @VAR_B var x = 1

var c = @VAR_C[0](@VAR_C[0](0))

var d = @VAR_D[0] @VAR_D[0] var x = 1

func main(){
    a+b+c+d-4
}
