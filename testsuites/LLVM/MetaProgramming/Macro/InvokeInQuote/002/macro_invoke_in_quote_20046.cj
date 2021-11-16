// DEPENDENCE: define_20046.cj
// EXEC: %compiler %cmp_opt define_20046.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_20046.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan count is 6!
// ASSERT: scan-not count is 7!

package use

import ast.*
import define_20046.*

func main(){
    var a = quote(@Y@Y@Y@Y@Y@Y(1))
    a.dump()
    return 0
}
