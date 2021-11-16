// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// ASSERT: scan illegal trailing closure, must be lambdaExpr in same line after macroExpression

import macro test.*

enum E<T>{e(T)}

func main(){
    e<Int64>@M[(1)](0)
    return 0
}
