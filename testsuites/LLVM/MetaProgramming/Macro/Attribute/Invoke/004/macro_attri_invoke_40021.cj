// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro test.*

func main(){
    var a = @M['a']('a')
    a = @M['\\']('\\')
    a = @M['\r']('\r')
    a = @M['\t']('\t')
    a = @M['\b']('\b')
    a = @M['\n']('\n')
    a = @M['\'']('\'')
    a = @M['\"']('\"')
    a = @M['\f']('\f')
    a = @M['\v']('\v')
    a = @M['\0']('\0')
    return 0
}
