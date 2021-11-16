// DEPENDENCE: define_20033.cj
// EXEC: %compiler %cmp_opt define_20033.cj -c -backend-options="-fPIC"
// EXEC-PIPE-1: %compiler %cmp_opt %f ./define_20033.o %use_ast -o %output 2>&1 | compare %f
package use

import ast.*
import define_20033.*

func main(){
    var a = quote(@X[0] var a)  // EXPECTED: regex variable declaration 'a' need at least one of type and initializer
    a.dump()
    return 0
}
