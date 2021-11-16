// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output


import macro test.*


func main(){
    @M[enum A{a}](0) // EXPECTED: regex enum type must be toplevel
    return 1
}
