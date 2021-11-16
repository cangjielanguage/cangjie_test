// DEPENDENCE: append_20080.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20080.cj %append_opt
// EXEC: %compiler %cmp_opt %f %enable_macro %append_pic_opt
// EXEC: %run_macro %compiler %cmp_opt %append_macro_lib_opt main.cj -o %output
// EXEC: %run %run_opt %output %run_args

package define

import append_20080.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var x = quote($('a'))
    var y = quote($('a'))
    if (x.size() != 1) {
        return quote(1)
    }
    if (y.size() != 1) {
        return quote(2)
    }
    return quote(0)
}