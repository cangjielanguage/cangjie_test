// DEPENDENCE: define_10026.cj

// EXEC: %compiler %cmp_opt define_10026.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_10026.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan description: colon
// ASSERT: scan description: sub

package use

import ast.*
import define_10026.*


func main(){
    var a = quote(@X @Y var x : Int64 - 1 )
    a.dump()
    return 0
}
