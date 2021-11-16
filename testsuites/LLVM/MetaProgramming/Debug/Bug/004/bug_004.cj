// DEPENDENCE: define_004.cj
// EXEC: %compiler %cmp_opt define_004.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f %macro_debug -o %output
// ASSERT: scan type of return expression is incompatible with expression type

package use

import define10014.*

func test(){0}

func main(){
    return @M{}()
}
