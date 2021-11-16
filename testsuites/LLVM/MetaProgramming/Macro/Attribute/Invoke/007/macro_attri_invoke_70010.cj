// DEPENDENCE:  test70010.cj  test.conf
// EXEC: %compiler %cmp_opt test70010.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro test.*

func foo(){
  @M[0](0)
}
func main(){
    return foo()
}
