// DEPENDENCE: define_20031.cj
// EXEC: %compiler %cmp_opt define_20031.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_20031.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan sub
package use

import ast.*
import define_20031.*

func main(){
    var a = quote(@X[1]var a : Int64)
    a.dump()
    return 0
}
