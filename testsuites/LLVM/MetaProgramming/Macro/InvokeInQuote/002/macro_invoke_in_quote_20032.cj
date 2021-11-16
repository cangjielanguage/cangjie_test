// DEPENDENCE: define_20032.cj
// EXEC: %compiler %cmp_opt define_20032.cj -c -backend-options="-fPIC"
// EXEC-PIPE-1: %compiler %cmp_opt %f ./define_20032.o %use_ast -o %output 2>&1 | compare %f
package use

import ast.*
import define_20032.*

func main(){
    var a = quote(@Y var a)  // EXPECTED: regex variable declaration 'a' need at least one of type and initializer
    a.dump()
    return 0
}
