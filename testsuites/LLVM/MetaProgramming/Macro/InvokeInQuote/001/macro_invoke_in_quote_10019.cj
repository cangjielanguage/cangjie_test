// DEPENDENCE: define_10019.cj

// EXEC: %compiler %cmp_opt define_10019.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_10019.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan description: add

package use

import ast.*
import define_10019.*


func main(){
    var a = quote(spawn @M{i:Int64=>i} )
    a.dump()
    return 0
}
