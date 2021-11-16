// DEPENDENCE: define_10018.cj

// EXEC: %compiler %cmp_opt define_10018.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_10018.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan description: add

package use

import ast.*
import define_10018.*


func main(){
    func test(i:(Int64)->Int64){}
    var a = quote(test@M{i:Int64=>i} ) // Trailing Closures
    a.dump()
    return 0
}
