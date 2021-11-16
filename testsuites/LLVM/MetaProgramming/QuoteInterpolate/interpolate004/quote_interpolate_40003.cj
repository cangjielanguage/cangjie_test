// DEPENDENCE: append_40003.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_40003.cj %append_opt
// EXEC: %compiler %cmp_opt %f %enable_macro %append_pic_opt
// EXEC: %run_macro %compiler %cmp_opt %append_macro_lib_opt main.cj -o %output | compare %f
// ASSERT: scan char_literal
// EXEC: %run %run_opt %output %run_args

package define

import append_40003.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var a = 'a'
    var x = quote(match (1) {case $a => c})
    var y = quote(match (1) {case $a => c})
    if (x.size() == 1) {
        return quote(1)
    }
    if (y.size() == 1) {
        return quote(2)
    }
    if (x.get(0).value != y.get(0).value) {
        return quote(3)
    }
    x.dump()
    y.dump()

    return quote(0)
}