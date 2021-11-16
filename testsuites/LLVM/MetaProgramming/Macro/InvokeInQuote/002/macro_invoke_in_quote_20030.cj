// DEPENDENCE: define_20030.cj
// EXEC: %compiler %cmp_opt define_20030.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_20030.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan sub
package use

import ast.*
import define_20030.*

func main(){
    var a = quote(@X[1]{i=>i}) // lambda
    a.dump()
    return 0
}
