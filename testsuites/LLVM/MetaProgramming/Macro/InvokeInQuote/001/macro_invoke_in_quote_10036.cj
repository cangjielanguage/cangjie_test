// DEPENDENCE: define_10036.cj

// EXEC: %compiler %cmp_opt define_10036.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_10036.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan description: at
// ASSERT: scan description: add

package use

import ast.*
import define_10036.*


func main(){
    var a = quote(\@@Y(1))
    a.dump()
    return 0
}
