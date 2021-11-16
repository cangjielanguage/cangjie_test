// DEPENDENCE: define_10025.cj

// EXEC: %compiler %cmp_opt define_10025.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_10025.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan description: add
// ASSERT: scan description: sub

package use

import ast.*
import define_10025.*


func main(){
    var a = quote(@M(internal let x : abc)- 1 )
    a.dump()
    return 0
}
