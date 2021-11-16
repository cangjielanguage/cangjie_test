// DEPENDENCE: define_a.cj define_aa.cj
// EXEC: %compiler %cmp_opt define_a.cj -c -backend-options="-fPIC" %enable_macro -o ./define_a.%middle
// EXEC: %compiler %cmp_opt define_aa.cj -c -backend-options="-fPIC" %enable_macro -o ./define_aa.%middle
// EXEC: %compiler %cmp_opt  %use_ast ./%llvm_attach/define_a.o ./%llvm_attach/define_aa.o %f %pic_opt

package main

import define_a.*
import macro define_aa.*

func test(){
    @testa(0)
    @testa(0)
    return 0
}