// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output


import macro test.*

func main(){
    @M[import](0) test.*  // EXPECTED: regex-auto expected newline or ';' between expression or declaration
    return 0
}
