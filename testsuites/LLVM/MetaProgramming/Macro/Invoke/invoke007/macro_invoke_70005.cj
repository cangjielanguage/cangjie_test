// DEPENDENCE:  test_70005.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// EXEC: %compiler %cmp_opt %pic_opt %macro_lib_opt test_70005.cj -o %output | compare %f
// ASSERT: scan pass

package define
from ast import ast.*

external macro M(input:Tokens){
    var it = input.iterator()
    it.next()
    if (it.seeing(INTEGER_LITERAL))
    {
        print("pass")
    } else {
        print("fail")
    }
    return input
}
