// DEPENDENCE: define_20001.cj
// EXEC: %compiler %cmp_opt define_20001.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_20001.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan description: add
// ASSERT: scan description: integer_literal
package use

import ast.*
import define_20001.*

func main(){
    var a = quote(@M[0](1))
    a.dump()
    return 0
}
