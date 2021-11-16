// DEPENDENCE: define_20045.cj
// EXEC: %compiler %cmp_opt define_20045.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_20045.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan count is 6!
// ASSERT: scan-not count is 7!

package use

import ast.*
import define_20045.*

func main(){
    var a = quote(@X[1]@X[1]@X[1]@X[1]@X[1]@X[1](1))
    a.dump()
    return 0
}
