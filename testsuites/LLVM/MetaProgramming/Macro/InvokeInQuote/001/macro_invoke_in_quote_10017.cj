// DEPENDENCE: define_10017.cj

// EXEC: %compiler %cmp_opt define_10017.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_10017.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan description: add

package use

import ast.*
import define_10017.*


func main(){
    var a = quote(@M {i:Int64=>i}(1) ) // lambda call
    a.dump()
    return 0
}
