// DEPENDENCE: define_a_30007.cj define_b_30007.cj define_c_30007.cj
// EXEC:%compiler %cmp_opt define_a_30007.cj -c -backend-options="-fPIC" %enable_macro
// EXEC:%compiler %cmp_opt define_b_30007.cj -c ./%llvm_attach/define_a_30007.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt define_c_30007.cj -c ./%llvm_attach/define_a_30007.o ./%llvm_attach/define_b_30007.o %use_pic_ast %enable_macro
// EXEC:%compiler %cmp_opt  ./%llvm_attach/define_a_30007.o ./%llvm_attach/define_b_30007.o ./%llvm_attach/define_c_30007.o %use_pic_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

package use

import C.*

func main(){
    return @c1[1](2) + @c2[1](2)
}
