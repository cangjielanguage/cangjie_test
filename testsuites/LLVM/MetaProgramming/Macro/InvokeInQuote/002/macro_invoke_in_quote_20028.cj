// DEPENDENCE: define_20028.cj
// EXEC: %compiler %cmp_opt define_20028.cj -c -backend-options="-fPIC"
// ERRCHECK: %compiler %cmp_opt %f ./define_20028.o %use_ast -o %output
// ASSERT: scan 'interface' is not allowed in block, expected expression or declaration here
package use

import ast.*
import define_20028.*

func main(){
    var a = quote(@X[1]interface A<T>{})
    a.dump()
    return 0
}
