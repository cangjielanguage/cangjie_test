// DEPENDENCE: define_10035.cj

// EXEC: %compiler %cmp_opt define_10035.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_10035.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan description: at

package use

import ast.*
import define_10035.*


func main(){
    var a = quote(\@Y)
    a.dump()
    return 0
}
