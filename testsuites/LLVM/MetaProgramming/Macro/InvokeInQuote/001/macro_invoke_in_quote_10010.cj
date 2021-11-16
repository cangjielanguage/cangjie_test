// DEPENDENCE: define_10010.cj

// EXEC: %compiler %cmp_opt define_10010.cj -c -backend-options="-fPIC"
// ERRCHECK: %compiler %cmp_opt %f ./define_10010.o %use_ast -o %output
// ASSERT: scan 'record' is not allowed in block, expected expression or declaration here
package use

import ast.*
import define_10010.*


func main(){
    var a = quote(@M record A{} - 1)
    a.dump()
    return 0
}
