// DEPENDENCE: define_10044.cj

// EXEC: %compiler %cmp_opt define_10044.cj -c -backend-options="-fPIC"
// EXEC-PIPE-1: %compiler %cmp_opt %f ./define_10044.o %use_ast -o %output 2>&1 | compare %f
// ASSERT: scan invalid at token here, do you mean '\@'

package use

import ast.*
import define_10044.*


func main(){
    var a = quote(@@Y
    func test() {} )
    a.dump()
    return 0
}
