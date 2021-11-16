// DEPENDENCE: define_20036.cj
// EXEC: %compiler %cmp_opt define_20036.cj -c -backend-options="-fPIC"
// EXEC-PIPE-1: %compiler %cmp_opt %f ./define_20036.o %use_ast -o %output 2>&1 | compare %f
// ASSERT: scan function declaration must have function body
package use

import ast.*
import define_20036.*

func main(){
    @Y func a():Int64
    return 0
}
