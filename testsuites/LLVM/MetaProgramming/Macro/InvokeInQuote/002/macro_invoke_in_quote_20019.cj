// DEPENDENCE: define_20019.cj
// EXEC: %compiler %cmp_opt define_20019.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_20019.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan sub
package use

from ast import ast.*
import define_20019.*

func main(){
    var a = quote(@X[
    1
    ](
    1
    ))
    a.dump()
    return 0
}
