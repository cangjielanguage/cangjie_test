// DEPENDENCE:  test_70006.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %pic_opt %macro_lib_opt test_70006.cj -o %output | compare %f
// ASSERT: scan pass

package define
from ast import ast.*

external macro M(input:Tokens){
    var it = input.iterator()
    match (it.next()) {
        case Some(obj) if (obj.value == "1") => print("pass")
        case _ => print("fail")
    }
    return input
}
