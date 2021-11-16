// DEPENDENCE: define_10046.cj

// EXEC: %compiler %cmp_opt define_10046.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_10046.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT:scan oh!

package use

import ast.*
import define_10046.*


func main(){
    var a = quote(@Y(1))
    return 0
}
