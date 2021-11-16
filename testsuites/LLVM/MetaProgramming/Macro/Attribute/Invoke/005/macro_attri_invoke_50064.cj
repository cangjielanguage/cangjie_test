// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output


import macro test.*

func main(){
    (1,2)[@M[1](0)] // EXPECTED: regex expected integer literal in tuple projection
    return 0
}
