// DEPENDENCE: define_20022.cj
// EXEC: %compiler %cmp_opt define_20022.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_20022.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan sub
package use

import ast.*
import define_20022.*

func main(){
    var a = quote(@X[1]func test<T>(){})
    a.dump()
    return 0
}
