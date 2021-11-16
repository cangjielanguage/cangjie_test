// DEPENDENCE: define_20009.cj
// EXEC: %compiler %cmp_opt define_20009.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_20009.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan sub
// ASSERT: scan add
package use

import ast.*
import define_20009.*

func main(){
    var a = quote(@X[1](@Y[1](1)))
    a.dump()
    return 0
}
