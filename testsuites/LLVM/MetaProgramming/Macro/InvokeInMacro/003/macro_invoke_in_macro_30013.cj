// DEPENDENCE: define_a_30013.cj define_b_30013.cj define_c_30013.cj define_d_30013.cj
// EXEC:%compiler %cmp_opt define_a_30013.cj -c -backend-options="-fPIC" %enable_macro
// EXEC:%compiler %cmp_opt define_b_30013.cj -c ./%llvm_attach/define_a_30013.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt define_c_30013.cj -c ./%llvm_attach/define_a_30013.o ./%llvm_attach/define_b_30013.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt define_d_30013.cj -c ./%llvm_attach/define_a_30013.o ./%llvm_attach/define_b_30013.o ./%llvm_attach/define_c_30013.o %use_pic_ast %enable_macro
// EXEC:%compiler %cmp_opt  ./%llvm_attach/define_a_30013.o ./%llvm_attach/define_b_30013.o ./%llvm_attach/define_c_30013.o ./%llvm_attach/define_d_30013.o %use_pic_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

package use

import D.*

func main(){
    return @d[1](2)
}
