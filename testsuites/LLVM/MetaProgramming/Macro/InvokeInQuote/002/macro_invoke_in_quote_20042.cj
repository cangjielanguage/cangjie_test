// DEPENDENCE: define_20042.cj
// EXEC: %compiler %cmp_opt define_20042.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_20042.o %use_ast -o %output
// EXEC: %run %run_opt %output  | compare %f
// ASSERT: scan oh!

package use

import ast.*
import define_20042.*

func main(){
    quote(@X[1](1))
    return 0
}
