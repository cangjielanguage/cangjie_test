// DEPENDENCE: define_20017.cj
// EXEC: %compiler %cmp_opt define_20017.cj -c -backend-options="-fPIC"
// EXEC-PIPE-1: %compiler %cmp_opt %f ./define_20017.o %use_ast -o %output 2>&1 | compare %f
// ASSERT: scan illegal newlines format
package use

import ast.*
import define_20017.*

func main(){
    var a = quote(@
    X[1](1))
    a.dump()
    return 0
}
