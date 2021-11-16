// DEPENDENCE: define_10006.cj

// EXEC: %compiler %cmp_opt define_10006.cj -c -backend-options="-fPIC"
// ERRCHECK: %compiler %cmp_opt %f ./define_10006.o %use_ast -o %output
// ASSERT: scan 'class' is not allowed in block, expected expression or declaration here
package use

import ast.*
import define_10006.*

func main(){
    var a = quote(@M class A<T>{} - 1)
    a.dump()
    return 0
}
