// DEPENDENCE: define10015.cj
// EXEC: %compiler %cmp_opt define10015.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output

package use

import define10015.*

func main(){
    return @M[x](y) // ASSERT: scan no matching function declaration for function call 'M'
}