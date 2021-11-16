// DEPENDENCE: define_10041.cj

// EXEC: %compiler %cmp_opt define_10041.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_10041.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan description: add

package use

import ast.*
import define_10041.*


func main(){
    var a = quote(@ Y
    func test() {} )
    a.dump()
    return 0
}
