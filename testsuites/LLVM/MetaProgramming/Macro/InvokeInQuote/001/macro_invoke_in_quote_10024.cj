// DEPENDENCE: define_10024.cj

// EXEC: %compiler %cmp_opt define_10024.cj -c -backend-options="-fPIC"
// ERRCHECK: %compiler %cmp_opt %f ./define_10024.o %use_ast -o %output
// ASSERT: scan 'internal' modifier is illegal for variable declaration in function body

package use

import ast.*
import define_10024.*


func main(){
    var a = quote(@M internal let x : abc - 1 )
    a.dump()
    return 0
}
