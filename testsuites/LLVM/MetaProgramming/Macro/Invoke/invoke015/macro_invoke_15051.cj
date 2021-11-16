// DEPENDENCE:  return_one.cj
// EXEC: %compiler %cmp_opt return_one.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro return_one.*


func main(){
    match {
        case @VAR_A(@VAR_A(0)) != 1 => 1
        case @VAR_B( @VAR_B var x = 1) != 1 => 1
        case @VAR_C[0](@VAR_C[0](0)) != 1 => 1
        case @VAR_D[0]( @VAR_D[0] var x = 1) != 1 => 1

        case @VAR_A(@VAR_D[0] var x = 1) != 1 => 1
        case @VAR_B( @VAR_A(0)) != 1 => 1
        case @VAR_C[0](@VAR_B var x = 1) != 1 => 1
        case @VAR_D[0]( @VAR_C[0](0)) != 1 => 1

        case @VAR_A(@VAR_C[0](0)) != 1 => 1
        case @VAR_B( @VAR_D[0] var x = 1) != 1 => 1
        case @VAR_C[0](@VAR_A(0)) != 1 => 1
        case @VAR_D[0]( @VAR_B var x = 1) != 1 => 1

        case @VAR_A(@VAR_B var x = 1) != 1 => 1
        case @VAR_B( @VAR_C[0](0)) != 1 => 1
        case @VAR_C[0](@VAR_D[0] var x = 1) != 1 => 1
        case @VAR_D[0]( @VAR_A(0)) != 1 => 1
        case _ => 0
    }
}
