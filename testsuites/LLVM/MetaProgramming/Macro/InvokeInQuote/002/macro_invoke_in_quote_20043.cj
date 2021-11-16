// DEPENDENCE: define_20043.cj
// EXEC: %compiler %cmp_opt define_20043.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_20043.o %use_ast -o %output | compare %f
// EXEC: %run %run_opt %output
// ASSERT: scan oh!

package use

import ast.*
import define_20043.*

func main(){
    quote($(@X[1](1)))
    return 0
}
