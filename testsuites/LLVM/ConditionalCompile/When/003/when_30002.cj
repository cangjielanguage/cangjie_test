// DEPENDENCE: test_30002.cj
// EXEC: %compiler %cmp_opt test_30002.cj %pic_opt
// EXEC: %run %compiler %cmp_opt -config="(test=true)" %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import macro test.*

@M[1]
@when[test=="true"]
func main(){0}
