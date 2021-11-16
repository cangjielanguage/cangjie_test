// DEPENDENCE: define_10027.cj
// EXEC: %compiler %cmp_opt define_10027.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_10027.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan description: colon
// ASSERT: scan description: sub

package use

from ast import ast.*
import define_10027.*


func main(){
    var a = quote(@X @Y {} - 1) // lambda
    a.dump()
    return 0
}
