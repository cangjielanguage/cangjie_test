// DEPENDENCE: define_10028.cj

// EXEC: %compiler %cmp_opt define_10028.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_10028.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan description: add
// ASSERT: scan description: sub

package use

import ast.*
import define_10028.*


func main(){
    var a = quote(@Y @Y func test(){} - 1)
    a.dump()
    return 0
}
