// DEPENDENCE: define_10042.cj

// EXEC: %compiler %cmp_opt define_10042.cj -c -backend-options="-fPIC"
// EXEC-PIPE-1: %compiler %cmp_opt %f ./define_10042.o %use_ast -o %output 2>&1 | compare %f

package use

import ast.*
import define_10042.*


func main(){
    var a = quote(@ Z // EXPECTED: regex undeclared identifier
    func test() {} )
    a.dump()
    return 0
}
