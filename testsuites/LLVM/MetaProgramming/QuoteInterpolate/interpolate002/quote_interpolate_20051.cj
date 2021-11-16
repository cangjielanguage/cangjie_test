// DEPENDENCE: append_20051.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20051.cj %append_opt
// EXEC: %compiler %cmp_opt %f %enable_macro %append_pic_opt
// EXEC: %run_macro %compiler %cmp_opt %append_macro_lib_opt main.cj -o %output
// EXEC: %run %run_opt %output %run_args

package define

import append_20051.*
from ast import ast.*


external macro test(input:Tokens):Tokens{
    var a = 1
    var b = 2
    var x = quote($(a**b))
    var y = quote($(a**b))


    if (x.size() != 1) {
        return quote(1)
    }
    if (x.get(0).value != y.get(0).value) {
            return quote(2)
    }

    return quote(0)
}