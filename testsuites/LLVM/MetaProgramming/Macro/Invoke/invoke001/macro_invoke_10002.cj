 // DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output

import macro test.*

func main(){
    M(flag = true) // EXPECTED: regex undeclared identifier 'M'
    if (flag) {
        return 0
    }else{
        return 1
    }
}
