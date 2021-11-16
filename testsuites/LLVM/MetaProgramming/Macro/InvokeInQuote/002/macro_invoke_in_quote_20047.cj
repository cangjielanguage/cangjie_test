// DEPENDENCE: define_20047.cj
// EXEC: %compiler %cmp_opt define_20047.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_20047.o %use_ast -o %output | compare %f
// EXEC: %run %run_opt %output
// ASSERT: scan count is 6!
// ASSERT: scan-not count is 7!

package use

import ast.*
import define_20047.*

func main(){
    var a = quote($(@Y@Y@Y@Y@Y@Y(1)))
    a.dump()
    return 0
}
