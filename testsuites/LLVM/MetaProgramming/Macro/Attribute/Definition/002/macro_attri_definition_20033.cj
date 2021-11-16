// DEPENDENCE: main.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt main.cj %macro_lib_opt -o %output | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan res is 1

package define

from ast import ast.*

external macro M(attr:Tokens,input:Tokens):Tokens{
    let a = 2
    var res = match (3) {
        case $a => 0
        case _ => 1
    }
    print("res is "+res.toString()+"\n")
    return quote($res)
}