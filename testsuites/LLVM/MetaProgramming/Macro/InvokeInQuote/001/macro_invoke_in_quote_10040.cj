// DEPENDENCE: define_10040.cj

// EXEC: %compiler %cmp_opt define_10040.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_10040.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan description: add

package use

import ast.*
import define_10040.*


func main(){
    var a = quote(@ Y (1))
    a.dump()
    return 0
}
