// DEPENDENCE: test_30003.cj
// EXEC: %compiler %cmp_opt test_30003.cj %pic_opt
// EXEC: %run %compiler %cmp_opt -config="(test=true)" %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import macro test.*


@when[test=="true"]
@M[1]
func main(){0}
