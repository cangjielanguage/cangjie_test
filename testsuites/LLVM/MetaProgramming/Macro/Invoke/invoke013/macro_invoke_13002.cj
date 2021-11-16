// DEPENDENCE:  definea.cj defineb.cj definec.cj defined.cj
// EXEC: %compiler %cmp_opt definea.cj -c -backend-options="-fPIC" %enable_macro -o definea.%middle
// EXEC: %compiler %cmp_opt defineb.cj -c -backend-options="-fPIC" %enable_macro -o defineb.%middle
// EXEC: %compiler %cmp_opt definec.cj -c -backend-options="-fPIC" %enable_macro -o definec.%middle
// EXEC: %compiler %cmp_opt defined.cj -c -backend-options="-fPIC" %enable_macro -o defined.%middle
// EXEC: %compiler %cmp_opt %use_ast ./%llvm_attach/definea.o ./%llvm_attach/defineb.o ./%llvm_attach/definec.o ./%llvm_attach/defined.o %f -o %output
// EXEC: %run %run_opt %output  %run_args

import definea.A
import defineb.B
import definec.C
import defined.D

func main(){
    3 - @C[0](@D[0]@B@A(0))
}

