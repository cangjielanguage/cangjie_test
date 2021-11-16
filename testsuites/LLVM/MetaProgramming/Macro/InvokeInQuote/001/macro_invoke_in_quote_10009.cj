// DEPENDENCE: define_10009.cj

// EXEC: %compiler %cmp_opt define_10009.cj -c -backend-options="-fPIC"
// ERRCHECK: %compiler %cmp_opt %f ./define_10009.o %use_ast -o %output
// ASSERT: scan 'interface' is not allowed in block, expected expression or declaration here
package use

import ast.*
import define_10009.*


func main(){
    var a = quote(@M interface A<T>{} - 1)
    a.dump()
    return 0
}
