// DEPENDENCE: append_20004.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20004.cj %append_opt
// EXEC: %compiler %cmp_opt %f %enable_macro %append_pic_opt
// EXEC: %run_macro %compiler %cmp_opt  %append_macro_lib_opt main.cj -o %output
// EXEC: %run %run_opt %output %run_args

package define

import append_20004.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var i = 1
    var x = quote($i=0)
    var y = quote($i=0)
    print(x.size().toString())
    if (x.size() != 3) {
        return quote(1)
    }
    if (x.get(0).value != y.get(0).value) {
            return quote(2)
    }

    if (x.get(0).value == quote(0).get(0).value) {
        return quote(3)
    }

    return quote(0)
}
