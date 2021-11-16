// DEPENDENCE: define_10005.cj

// EXEC: %compiler %cmp_opt define_10005.cj -c -backend-options="-fPIC"
// ERRCHECK: %compiler %cmp_opt %f ./define_10005.o %use_ast -o %output
// ASSERT: scan 'class' is not allowed in block, expected expression or declaration here

package use

import ast.*
import define_10005.*

func main(){
    var a = quote(@M class A{} - 1)
    a.dump()
    return 0
}
