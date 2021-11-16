// DEPENDENCE: define_a_30004.cj define_b_30004.cj define_c_30004.cj
// EXEC:%compiler %cmp_opt define_a_30004.cj -c -backend-options="-fPIC" %enable_macro
// EXEC:%compiler %cmp_opt define_b_30004.cj -c ./%llvm_attach/define_a_30004.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt define_c_30004.cj -c ./%llvm_attach/define_a_30004.o ./%llvm_attach/define_b_30004.o %use_pic_ast %enable_macro
// EXEC:%compiler %cmp_opt  ./%llvm_attach/define_a_30004.o ./%llvm_attach/define_b_30004.o ./%llvm_attach/define_c_30004.o %use_pic_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

package use

import C.*

func main(){
    return @c1[1](2)
}
