// DEPENDENCE: define_20024.cj
// EXEC: %compiler %cmp_opt define_20024.cj -c -backend-options="-fPIC"
// ERRCHECK: %compiler %cmp_opt %f ./define_20024.o %use_ast -o %output
// ASSERT: scan 'class' is not allowed in block, expected expression or declaration here
package use

import ast.*
import define_20024.*

func main(){
    var a = quote(@X[1]class A<T>{})
    a.dump()
    return 0
}
