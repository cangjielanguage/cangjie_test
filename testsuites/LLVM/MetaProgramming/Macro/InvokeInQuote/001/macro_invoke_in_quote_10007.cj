// DEPENDENCE: define_10007.cj

// EXEC: %compiler %cmp_opt define_10007.cj -c -backend-options="-fPIC"
// ERRCHECK: %compiler %cmp_opt %f ./define_10007.o %use_ast -o %output
// ASSERT: scan 'interface' is not allowed in block, expected expression or declaration here
package use

import ast.*
import define_10007.*

func main(){
    var a = quote(@M interface A{} - 1)
    a.dump()
    return 0
}
