// DEPENDENCE: define_10023.cj

// EXEC: %compiler %cmp_opt define_10023.cj -c -backend-options="-fPIC"
// ERRCHECK: %compiler %cmp_opt %f ./define_10023.o %use_ast -o %output
// ASSERT: scan 'external' modifier is illegal for variable declaration in function body

package use

import ast.*
import define_10023.*


func main(){
    var a = quote(@M external let x : abc - 1 )
    a.dump()
    return 0
}
