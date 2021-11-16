// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output

package use

import macro define.*

func main(){
    return @[x](y) // EXPECTED: regex invalid return expression
}