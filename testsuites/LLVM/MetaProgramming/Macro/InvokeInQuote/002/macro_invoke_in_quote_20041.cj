// DEPENDENCE: define_20041.cj
// EXEC: %compiler %cmp_opt define_20041.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_20041.o %use_ast -o %output
// EXEC: %run %run_opt %output

package use

import ast.*
import define_20041.*

func main(){
    @X[1] var (x,y) = (1,1)
    return 0
}
