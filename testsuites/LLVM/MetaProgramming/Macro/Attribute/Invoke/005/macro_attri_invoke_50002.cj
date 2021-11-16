// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output


import macro test.*

func main(){
    @M[package 50001](a)  // EXPECTED: regex invalid node expanded in macro call's father node
    return 0
}
