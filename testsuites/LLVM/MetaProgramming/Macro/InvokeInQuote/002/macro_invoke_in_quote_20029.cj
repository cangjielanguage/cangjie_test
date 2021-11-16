// DEPENDENCE: define_20029.cj
// EXEC: %compiler %cmp_opt define_20029.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_20029.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan sub
package use

import ast.*
import define_20029.*

func main(){
    var a = quote(@X[1]{}) // lambda
    a.dump()
    return 0
}
