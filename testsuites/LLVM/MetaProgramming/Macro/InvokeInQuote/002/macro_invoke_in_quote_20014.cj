// DEPENDENCE: define_20014.cj
// EXEC: %compiler %cmp_opt define_20014.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_20014.o %use_ast -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan a is 24
package use

import ast.*
import define_20014.*

func main(){
    var a = @X[1]@Y[1]@Y[1]@Y[1]@Y[1]@Y[1]@Y[1]@Y[1]@Y[1]@Y[1]@Y[1]@Y[1]@Y[1]@Y[1]@Y[1]@Y[1]@Y[1]@Y[1]@Y[1]@Y[1]@Y[1]@Y[1]@Y[1]@Y[1]@Y[1](1)
    print("a is ${a}\n")
    return 0
}
