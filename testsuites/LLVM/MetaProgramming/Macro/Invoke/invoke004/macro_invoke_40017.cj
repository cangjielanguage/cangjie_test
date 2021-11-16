// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC: %run %run_opt %output  %run_args

import test.*

func main(){
    var ab= 1
    var a_b= 1
    var a1= 1
    var ab_1= 1
    var `a`= 1
    var `a1`= 1
    var `a_`= 1
    var `ab_1`= 1
    @M(ab)
    @M(a_b)
    @M(a1)
    @M(ab_1)
    @M(`a`)
    @M(`a1`)
    @M(`a_`)
    @M(`ab_1`)
    return 0
}
