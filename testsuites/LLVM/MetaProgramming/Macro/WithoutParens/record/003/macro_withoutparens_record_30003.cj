// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import macro define.*

record A{}
@M // EXPECTED: regex redefinition of declaration 'A'
record B{}


func main(){
    A()
    return 0
}