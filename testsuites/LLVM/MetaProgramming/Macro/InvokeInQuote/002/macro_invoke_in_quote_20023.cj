// DEPENDENCE: define_20023.cj
// EXEC: %compiler %cmp_opt define_20023.cj -c -backend-options="-fPIC"
// ERRCHECK: %compiler %cmp_opt %f ./define_20023.o %use_ast -o %output
// ASSERT: scan 'class' is not allowed in block, expected expression or declaration here

package use

import ast.*
import define_20023.*

func main(){
    var a = quote(@X[1]class A{})
    a.dump()
    return 0
}
