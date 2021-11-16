// DEPENDENCE: define_20038.cj
// EXEC: %compiler %cmp_opt define_20038.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_20038.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan token_literal_value: 0

package use

import ast.*
import define_20038.*

func main(){
    var a = quote($(@X[1](1)))
    a.dump()
    return 0
}
