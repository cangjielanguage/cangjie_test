// DEPENDENCE: define_10022.cj

// EXEC: %compiler %cmp_opt define_10022.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_10022.o %use_ast -o %output
// EXEC: %run %run_opt %output

package use

import ast.*
import define_10022.*


func main(){
    return @M let x : abc - 2
}
