// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC-PIPE-1: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output 2>&1 | compare %f

import macro test.*

func main(){
    print("result is ${@M[return](1)}") // EXPECTED: regex no matching function declaration for function call 'print'
    return 0
}
