// DEPENDENCE: define_10039.cj

// EXEC: %compiler %cmp_opt define_10039.cj -c -backend-options="-fPIC"
// EXEC-PIPE-1: %compiler %cmp_opt %f ./define_10039.o %use_ast -o %output 2>&1 | compare %f
// ASSERT: scan illegal newlines format

package use

import ast.*
import define_10039.*


func main(){
    var a = quote(@
    Y(1))
    a.dump()
    return 0
}
