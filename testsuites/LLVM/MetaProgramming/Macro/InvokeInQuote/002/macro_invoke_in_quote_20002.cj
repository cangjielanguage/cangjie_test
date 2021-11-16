// DEPENDENCE: define_20002.cj
// EXEC: %compiler %cmp_opt define_20002.cj -c -backend-options="-fPIC"
// EXEC-PIPE-1: %compiler %cmp_opt %f ./define_20002.o %use_ast -o %output 2>&1 | compare %f

package use

import ast.*
import define_20002.*

func main(){
    var a = quote(@M(1)) // EXPECTED: regex missing argument for call with parameter list
    a.dump()
    return 0
}
