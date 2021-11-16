// DEPENDENCE: define_01111.cj  define_01111a.cj
// EXEC: %compiler %cmp_opt define_01111.cj -c -backend-options="-fPIC" %enable_macro -o ./define_01111.%middle
// EXEC: %compiler %cmp_opt define_01111a.cj -c -backend-options="-fPIC" %enable_macro -o ./define_01111a.%middle
// EXEC: %compiler %cmp_opt ./%llvm_attach/define_01111.o ./%llvm_attach/define_01111a.o %use_ast %f  -o %output
// EXEC: %run %run_opt %output %run_args

import define_01111.*
import define_01111a.*

func main(){
    var a = 2
    @M[a](=1)
    @M(a=0)
    return a
}


