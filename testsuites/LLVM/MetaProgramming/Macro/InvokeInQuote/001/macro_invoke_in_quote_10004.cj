// DEPENDENCE: define_10004.cj

// EXEC: %compiler %cmp_opt define_10004.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_10004.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan description: add
// ASSERT: scan description: sub
package use

import ast.*
import define_10004.*

func main(){
    var a = quote(@M {} - 1) // empty lambda
    a.dump()
    return 0
}
