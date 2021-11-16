// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import macro define.*


@M CLASS A {} // EXPECTED: regex illegal object in toplevel, toplevel must consist of declaration or definition


func main(){
    return 0
}