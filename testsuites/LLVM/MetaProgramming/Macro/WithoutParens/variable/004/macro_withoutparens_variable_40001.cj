// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import macro define.*

var a = 0

@M var b = 0 // ASSERT: scan redefinition of declaration 'a'

func main(){
    return a
}