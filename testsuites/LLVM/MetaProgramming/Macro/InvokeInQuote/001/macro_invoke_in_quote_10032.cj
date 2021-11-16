// DEPENDENCE: define_10032.cj

// EXEC: %compiler %cmp_opt define_10032.cj -c -backend-options="-fPIC"
// EXEC-PIPE-1: %compiler %cmp_opt %f ./define_10032.o %use_ast -o %output 2>&1 | compare %f
// ASSERT: scan invalid at token here, do you mean '\@'

package use

import ast.*
import define_10032.*


func main(){
    var a = quote(@)
    a.dump()
    return 0
}
