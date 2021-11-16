// DEPENDENCE: define_20005.cj
// EXEC: %compiler %cmp_opt define_20005.cj -c -backend-options="-fPIC"
// EXEC-PIPE-1: %compiler %cmp_opt %f ./define_20005.o %use_ast -o %output 2>&1 | compare %f
// ASSERT: scan illegal macro input attrs

package use

import ast.*
import define_20005.*

func main(){
    var a = quote(@M[](1))
    a.dump()
    return 0
}
