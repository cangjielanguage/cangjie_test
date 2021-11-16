// DEPENDENCE: test_10025.cj
// EXEC: %compiler %cmp_opt -config="(test=true)" %pic_opt test_10025.cj
// EXEC: %run %compiler %cmp_opt -config="(test=true)"  %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package foo

import macro test.*

@when[test=="true"]
@M[123]
var x = 0

@when[test=="true"]
func main(){
    return x
}