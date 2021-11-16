// DEPENDENCE: define_10038.cj

// EXEC: %compiler %cmp_opt define_10038.cj -c -backend-options="-fPIC"
// EXEC-PIPE-1: %compiler %cmp_opt %f ./define_10038.o %use_ast -o %output 2>&1 | compare %f
// ASSERT: scan illegal newlines format

package use

import ast.*
import define_10038.*


func main(){
    var a = quote(@Y
    (1))
    a.dump()
    return 0
}
