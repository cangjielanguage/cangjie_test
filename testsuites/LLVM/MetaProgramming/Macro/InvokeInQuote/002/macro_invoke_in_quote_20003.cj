// DEPENDENCE: define_20003.cj
// EXEC: %compiler %cmp_opt -ulimit-error define_20003.cj -c -backend-options="-fPIC"
// EXEC-PIPE-1: %compiler %cmp_opt %f ./define_20003.o %use_ast -o %output 2>&1 | compare %f
// ASSERT: scan extra argument given for call with parameter

package use

import ast.*
import define_20003.*

func main(){
    var a = quote(@M[1](1))
    a.dump()
    return 0
}
