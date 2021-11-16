// DEPENDENCE: define_10002.cj
// EXEC: %compiler %cmp_opt define_10002.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_10002.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan description: integer_literal
// ASSERT: scan token_literal_value: 2
package use

import ast.*
import define_10002.*

func main(){
    var a = quote($(@M(1)))
    a.dump()
    return 0
}
