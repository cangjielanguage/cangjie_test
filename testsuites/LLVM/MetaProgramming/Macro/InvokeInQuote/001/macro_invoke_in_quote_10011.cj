// DEPENDENCE: define_10011.cj

// EXEC: %compiler %cmp_opt define_10011.cj -c -backend-options="-fPIC"
// ERRCHECK: %compiler %cmp_opt %f ./define_10011.o %use_ast -o %output
// ASSERT: scan 'record' is not allowed in block, expected expression or declaration here
package use

import ast.*
import define_10011.*


func main(){
    var a = quote(@M record A<T>{} - 1)
    a.dump()
    return 0
}
