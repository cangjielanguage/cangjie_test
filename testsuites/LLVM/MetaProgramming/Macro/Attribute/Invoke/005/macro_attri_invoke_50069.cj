// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// ASSERT: scan macro_expand_expr is illegal before this increment or decrement expression

import macro test.*

func main(){
    var a = 1
    @M[a](0)++
    @M[a](0)--
    return 0
}
