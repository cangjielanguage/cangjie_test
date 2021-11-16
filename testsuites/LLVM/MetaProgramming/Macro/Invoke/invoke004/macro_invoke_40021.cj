// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC: %run %run_opt %output  %run_args

import test.*

func main(){
    var a = @M('a')
    a = @M('\\')
    a = @M('\r')
    a = @M('\t')
    a = @M('\b')
    a = @M('\n')
    a = @M('\'')
    a = @M('\"')
    a = @M('\f')
    a = @M('\v')
    a = @M('\0')
    return 0
}
