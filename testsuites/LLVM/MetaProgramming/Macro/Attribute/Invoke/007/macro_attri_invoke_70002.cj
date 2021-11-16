// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import macro test.*

M[external]func foo(){0} // EXPECTED: regex illegal object in toplevel, toplevel must consist of declaration or definition


func main(){
    return foo()
}
