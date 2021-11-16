// DEPENDENCE: define_a_40010.cj define_b_40010.cj define_aa_40010.cj
// EXEC: %compiler %cmp_opt define_a_40010.cj define_aa_40010.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt define_b_40010.cj -c ./%llvm_attach/define_a_40010.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt ./%llvm_attach/define_a_40010.o ./%llvm_attach/define_b_40010.o %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

package use

import B.*

func main(){
    return @b[1](0)
}
