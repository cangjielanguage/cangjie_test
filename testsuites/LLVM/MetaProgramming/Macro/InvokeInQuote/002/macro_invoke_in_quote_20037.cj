// DEPENDENCE: define_20037.cj
// EXEC: %compiler %cmp_opt define_20037.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_20037.o %use_ast -o %output
// EXEC: %run %run_opt %output

package use

import ast.*
import define_20037.*

interface A{
    @Y func a():Int64
}

func main(){
    return 0
}
