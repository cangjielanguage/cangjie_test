// DEPENDENCE: define_20008.cj
// EXEC: %compiler %cmp_opt define_20008.cj -c -backend-options="-fPIC"
// EXEC-PIPE-1: %compiler %cmp_opt %f ./define_20008.o %use_ast -o %output 2>&1 | compare %f
// ASSERT: scan illegal attribute tokens in macro call, which is '@'

package use

import ast.*
import define_20008.*

func main(){
    // var a = quote(@X[@Y[1](1)](@Y[1](1)))
    var a = @X[@Y[1](1)](@Y[1](1))
    a.dump()
    return 0
}
