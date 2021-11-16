// DEPENDENCE: define_20020.cj
// EXEC: %compiler %cmp_opt define_20020.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_20020.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan sub
package use

import ast.*
import define_20020.*

func main(){
    var a = quote(@X[1]var x = 1)
    a.dump()
    return 0
}
