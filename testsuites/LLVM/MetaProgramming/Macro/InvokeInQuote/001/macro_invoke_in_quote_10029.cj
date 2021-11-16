// DEPENDENCE: define_10029.cj

// EXEC: %compiler %cmp_opt define_10029.cj -c -backend-options="-fPIC"
// ERRCHECK: %compiler %cmp_opt %f ./define_10029.o %use_ast -o %output
// ASSERT: scan 'class' is not allowed in block, expected expression or declaration here

package use

import ast.*
import define_10029.*


func main(){
    var a = quote(@Y @Y class A{} - 1)
    a.dump()
    return 0
}
