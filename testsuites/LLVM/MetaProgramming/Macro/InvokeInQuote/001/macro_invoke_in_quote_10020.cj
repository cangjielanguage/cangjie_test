// DEPENDENCE: define_10020.cj

// EXEC: %compiler %cmp_opt define_10020.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_10020.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan description: add
// ASSERT: scan description: sub

package use

import ast.*
import define_10020.*


func main(){
    var a = quote(@M let x : Int64 - 1 )
    a.dump()
    return 0
}
