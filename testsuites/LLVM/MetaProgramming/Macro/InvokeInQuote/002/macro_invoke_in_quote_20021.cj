// DEPENDENCE: define_20021.cj
// EXEC: %compiler %cmp_opt define_20021.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_20021.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan sub
package use

import ast.*
import define_20021.*

func main(){
    var a = quote(@X[1]func test(){})
    a.dump()
    return 0
}
