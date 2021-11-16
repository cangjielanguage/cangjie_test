// DEPENDENCE: define_a_30014.cj define_b_30014.cj define_c_30014.cj define_d_30014.cj define_e_30014.cj
// EXEC: %compiler %cmp_opt define_a_30014.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt define_b_30014.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt define_c_30014.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt define_d_30014.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt define_e_30014.cj -c ./%llvm_attach/define_a_30014.o ./%llvm_attach/define_b_30014.o ./%llvm_attach/define_c_30014.o ./%llvm_attach/define_d_30014.o %use_pic_ast %enable_macro
// EXEC:%compiler %cmp_opt  ./%llvm_attach/define_a_30014.o ./%llvm_attach/define_b_30014.o ./%llvm_attach/define_c_30014.o ./%llvm_attach/define_d_30014.o ./%llvm_attach/define_e_30014.o %use_pic_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

package use

import E.*

func main(){
    return @e[1](2)
}
