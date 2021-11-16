// DEPENDENCE: define_10008.cj

// EXEC: %compiler %cmp_opt define_10008.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_10008.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan description: add
// ASSERT: scan description: sub
package use

import ast.*
import define_10008.*

var a = quote(@M interface A{} - 1)

func main(){
    a.dump()
    return 0
}
