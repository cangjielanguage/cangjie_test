// DEPENDENCE: define_20026.cj
// EXEC: %compiler %cmp_opt define_20026.cj -c -backend-options="-fPIC"
// ERRCHECK: %compiler %cmp_opt %f ./define_20026.o %use_ast -o %output
// ASSERT: scan 'record' is not allowed in block, expected expression or declaration here
package use

import ast.*
import define_20026.*

func main(){
    var a = quote(@X[1]record A<T>{})
    a.dump()
    return 0
}
