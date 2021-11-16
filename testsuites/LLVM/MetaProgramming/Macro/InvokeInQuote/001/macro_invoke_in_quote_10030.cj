// DEPENDENCE: define_10030.cj

// EXEC: %compiler %cmp_opt define_10030.cj -c -backend-options="-fPIC"
// ERRCHECK: %compiler %cmp_opt %f ./define_10030.o %use_ast -o %output
// ASSERT: scan 'foreign' modifier is illegal for variable declaration in function body

package use

import ast.*
import define_10030.*


func main(){
    var a = quote(@Y @Y foreign var a : Int64 - 1)
    a.dump()
    return 0
}
