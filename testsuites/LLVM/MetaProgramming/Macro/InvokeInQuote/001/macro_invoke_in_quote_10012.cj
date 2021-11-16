// DEPENDENCE: define_10012.cj

// EXEC: %compiler %cmp_opt define_10012.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_10012.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan description: add
// ASSERT: scan description: sub
package use

import ast.*
import define_10012.*


func main(){
    var a = quote(@M func test<T>(){} - 1)
    a.dump()
    return 0
}
