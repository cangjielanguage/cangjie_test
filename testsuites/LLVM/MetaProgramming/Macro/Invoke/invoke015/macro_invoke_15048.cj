// DEPENDENCE:  return_one.cj main.cj
// EXEC: %compiler %cmp_opt return_one.cj %enable_macro  %pic_opt
// EXEC: %compiler %cmp_opt %f %macro_lib_opt -c -backend-options="-fPIC" %enable_macro -o %n.%middle
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt ./%llvm_attach/%n.o main.cj -o %output
// EXEC: %run %run_opt %output %run_args

package define

import macro return_one.*
from ast import ast.*

external macro M(input:Tokens){
    return quote($(@VAR_A(@VAR_B var x = 1)))
     + quote(+) + quote($(@VAR_B @VAR_C[0](0)))
     + quote(+) + quote($(@VAR_C[0](@VAR_D[0] var x = 1)))
     + quote(+) + quote($(@VAR_D[0] @VAR_A(0)))
     + quote(-4)
}



