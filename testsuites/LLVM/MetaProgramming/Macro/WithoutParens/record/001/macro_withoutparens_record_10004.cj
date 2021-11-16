// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import macro define.*

func main(){
    @M record A{} // EXPECTED: regex 'record' is not allowed in block, expected expression or declaration here
    return 0
}