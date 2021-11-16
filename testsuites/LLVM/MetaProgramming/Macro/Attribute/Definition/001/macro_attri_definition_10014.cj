// DEPENDENCE: define_a.cj define_b.cj
// EXEC: %compiler %cmp_opt define_a.cj -c -backend-options="-fPIC" %enable_macro -o ./define_a.%middle
// EXEC: %compiler %cmp_opt define_b.cj -c -backend-options="-fPIC" %enable_macro -o ./define_b.%middle
// EXEC: %compiler %cmp_opt %use_ast ./%llvm_attach/define_a.o ./%llvm_attach/define_b.o %f -o %output
// EXEC: %run %run_opt %output %run_args

package test

import define_a.*
import macro define_b.*

func main(){
    @testa(0)
    @testb(0)
    return 0
}