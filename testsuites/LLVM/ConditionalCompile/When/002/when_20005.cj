// DEPENDENCE: test_20005.cj
// EXEC: %compiler %cmp_opt test_20005.cj %pic_opt
// EXEC: %run %compiler %cmp_opt -config="(test=true)" %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import macro test.*

@when[test=="true"]
func main(){0}
