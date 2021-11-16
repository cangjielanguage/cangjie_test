// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import macro test.*


func main(){
    if (false) { // ASSERT: scan invalid node expanded in macro call's father node
        @M[ return 1
    } else if (true) {
        return 0 ](0)
    } else {
        return 1
    }
}
