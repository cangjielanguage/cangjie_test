// DEPENDENCE: define_10043.cj

// EXEC: %compiler %cmp_opt define_10043.cj -c -backend-options="-fPIC"
// EXEC-PIPE-1: %compiler %cmp_opt %f ./define_10043.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan description: add

package use

import ast.*
import define_10043.*


func main(){
    var a = quote(@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y
    func test() {})
    a.dump()
    return 0
}
