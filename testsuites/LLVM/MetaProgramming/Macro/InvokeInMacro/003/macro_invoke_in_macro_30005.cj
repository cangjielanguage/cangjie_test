// DEPENDENCE: define_a_30005.cj define_b_30005.cj define_c_30005.cj
// EXEC:%compiler %cmp_opt define_a_30005.cj -c -backend-options="-fPIC" %enable_macro
// EXEC:%compiler %cmp_opt define_b_30005.cj -c ./%llvm_attach/define_a_30005.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt define_c_30005.cj -c ./%llvm_attach/define_a_30005.o ./%llvm_attach/define_b_30005.o %use_pic_ast %enable_macro
// EXEC:%compiler %cmp_opt  ./%llvm_attach/define_a_30005.o ./%llvm_attach/define_b_30005.o ./%llvm_attach/define_c_30005.o %use_pic_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

package use

import C.*

func main(){
    return @c1[1](2)
}
