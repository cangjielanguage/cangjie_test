// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro test.*

func foo(){[(0,1)]}

func main(){
    var res = @M[[foo()[0],((0,1),(0,1))[0]]]([1][0])
    return res
}
