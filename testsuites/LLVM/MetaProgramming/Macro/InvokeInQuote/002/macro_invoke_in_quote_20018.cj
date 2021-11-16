// DEPENDENCE: define_20018.cj
// EXEC: %compiler %cmp_opt define_20018.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_20018.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan at
package use

import ast.*
import define_20018.*

func main(){
    var a = quote(\@
    X[1](1))
    a.dump()
    return 0
}
