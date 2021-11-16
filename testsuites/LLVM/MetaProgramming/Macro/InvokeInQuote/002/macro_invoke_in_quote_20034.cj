// DEPENDENCE: define_20034.cj
// EXEC: %compiler %cmp_opt define_20034.cj -c -backend-options="-fPIC"
// EXEC-PIPE-1: %compiler %cmp_opt %f ./define_20034.o %use_ast -o %output 2>&1 | compare %f
package use

import ast.*
import define_20034.*

func main(){
    @X[0] var a  // EXPECTED: regex variable declaration 'a' need at least one of type and initializer
    return 0
}
