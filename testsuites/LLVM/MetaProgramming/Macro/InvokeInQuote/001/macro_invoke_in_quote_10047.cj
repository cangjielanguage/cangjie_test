// DEPENDENCE: define_10047.cj

// EXEC: %compiler %cmp_opt define_10047.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_10047.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT:scan description: add

package use

import ast.*
import define_10047.*


func main(){
    var a = quote(@Y(1))
    a.dump()
    return 0
}
