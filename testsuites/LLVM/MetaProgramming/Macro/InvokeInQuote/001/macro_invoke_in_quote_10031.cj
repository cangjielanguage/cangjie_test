// DEPENDENCE: define_10031.cj

// EXEC: %compiler %cmp_opt define_10031.cj -c -backend-options="-fPIC"
// EXEC-PIPE-1: %compiler %cmp_opt %f ./define_10031.o %use_ast -o %output 2>&1 | compare %f
// ASSERT: scan illegal macro expand input args

package use

import ast.*
import define_10031.*


func main(){
    var a = quote(@Y)
    a.dump()
    return 0
}
