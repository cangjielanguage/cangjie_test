// DEPENDENCE:  test_70007.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt test_70007.cj -o %output | compare %f
// ASSERT: scan pass

package define
from ast import ast.*

external macro M(input:Tokens){
    var it = input.iterator()
    it.next()
    match (it.peek()) {
        case Some(obj) if (obj.value == "1") => print("pass")
        case _ => print("fail")
    }
    return input
}
