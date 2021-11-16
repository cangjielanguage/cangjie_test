// DEPENDENCE: define_10013.cj

// EXEC: %compiler %cmp_opt define_10013.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_10013.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan description: add

package use

import ast.*
import define_10013.*


func main(){
    var a = quote(@M var x : Int64 = 1 == - 1)
    a.dump()
    return 0
}
