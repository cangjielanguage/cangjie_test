// DEPENDENCE: define_20006.cj
// EXEC: %compiler %cmp_opt define_20006.cj -c -backend-options="-fPIC"
// EXEC-PIPE-1: %compiler %cmp_opt %f ./define_20006.o %use_ast -o %output 2>&1 | compare %f
// ASSERT: scan illegal macro expand input args

package use

import ast.*
import define_20006.*

func main(){
    var a = quote(@M[1]())
    a.dump()
    return 0
}
