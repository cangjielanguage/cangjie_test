// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output


import test.*


func main(){
    @M(var) a = 1 // EXPECTED: regex expected newline or ';' between expression or declaration
    return a-1
}
