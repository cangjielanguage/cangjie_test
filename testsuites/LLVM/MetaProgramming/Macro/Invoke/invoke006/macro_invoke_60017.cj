// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output


import test.*

func main(){
    print("result is ${@M(return 1)}") //EXPECTED: regex undeclared identifier
    return 0
}
