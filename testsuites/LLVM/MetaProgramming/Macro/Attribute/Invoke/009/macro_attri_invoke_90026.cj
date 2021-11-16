// DEPENDENCE: define_class.cj
// EXEC: %compiler %cmp_opt define_class.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import define_class.*

@M[x] CLASS A {} // EXPECTED: regex illegal object in toplevel, toplevel must consist of declaration or definition

func main(){
    return 0
}