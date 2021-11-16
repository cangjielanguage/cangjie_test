// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output

import test.*


func main(){
    if (false) {
        @M( return 1 // EXPECTED: regex invalid node expanded in macro call's father node
    } else if (true) {
        return 0)
    } else {
        return 1
    }
}
