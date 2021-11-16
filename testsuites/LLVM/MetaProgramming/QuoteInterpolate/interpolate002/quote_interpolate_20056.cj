// DEPENDENCE: append_20056.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20056.cj %append_opt
// EXEC: %compiler %cmp_opt %enable_macro %f %append_pic_opt
// EXEC: %run_macro %compiler %cmp_opt  %append_macro_lib_opt main.cj -o %output
// EXEC: %run %run_opt %output %run_args

package define

import append_20056.*
from ast import ast.*


external macro test(input:Tokens):Tokens{
    var a = true
    var x = quote($(!a))
    var y = quote($(!a))

    if (x.size() != 1) {
        return quote(1)
    }
    if (x.get(0).value != y.get(0).value) {
            return quote(2)
    }

    return quote(0)
}