// DEPENDENCE: main.cj
// EXEC: %compiler %cmp_opt %f %pic_opt
// EXEC: %run %compiler %cmp_opt main.cj %macro_lib_opt -o %output | compare %f
// EXEC: %run %run_opt %output
// ASSERT: scan res is 1

package define

from ast import ast.*

external macro M(attr:Tokens,input:Tokens):Tokens{
    let a = 3
    var res = match (2) {
        case x@$a => 2
        case _ => 1
    }
    print("res is " + res.toString() + "\n")
    return quote($res)
}