// DEPENDENCE:  return_one.cj
// EXEC: %compiler %cmp_opt return_one.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro return_one.*

var l1 = {=>@VAR_A(@VAR_D[0] var x = 1)}
var l2 = {=>@VAR_B @VAR_A(0)}
var l3 = {=>@VAR_C[0](@VAR_B var x = 1)}
var l4 = {=>@VAR_D[0] @VAR_C[0](0)}

func main(){
    l1()+l2()+l3()+l4()-4
}
