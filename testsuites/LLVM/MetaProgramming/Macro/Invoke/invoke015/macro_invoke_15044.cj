// DEPENDENCE:  return_one.cj main.cj
// EXEC: %compiler %cmp_opt return_one.cj %enable_macro %pic_opt
// EXEC: %compiler %cmp_opt %f -c  %macro_lib_opt -backend-options="-fPIC" %enable_macro -o %n.%middle
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt ./%llvm_attach/%n.o main.cj -o %output
// EXEC: %run %run_opt %output %run_args

package define

import macro return_one.*
from ast import ast.*

external macro M(input:Tokens){
    return quote($(@VAR_A(1)) - 1)
}



