
// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output


import test.*

func main(){
    @M(type mytype = Int64) // EXPECTED: regex type must be declared on toplevel
    return 1
}
