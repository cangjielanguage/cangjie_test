// DEPENDENCE: define_a_40009.cj define_b_40009.cj define_bb_40009.cj
// EXEC: %compiler %cmp_opt define_a_40009.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt define_b_40009.cj define_bb_40009.cj -c ./%llvm_attach/define_a_40009.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt ./%llvm_attach/define_a_40009.o ./%llvm_attach/define_b_40009.o %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

package use

import B.*

func main(){
    return @b1[1](0) + @b2[1](0)
}
