// DEPENDENCE: define_20044.cj
// EXEC: %compiler %cmp_opt define_20044.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_20044.o %use_ast -o %output | compare %f
// EXEC: %run %run_opt %output
// ASSERT: scan count is 6!
// ASSERT: scan-not count is 7!

package use

import ast.*
import define_20044.*

func main(){
    quote($(@X[1]@X[1]@X[1]@X[1]@X[1]@X[1](1)))
    return 0
}
