// DEPENDENCE: append_20104.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20104.cj %append_opt
// EXEC-PIPE-1: %compiler %cmp_opt %f %append_pic_opt 2>&1 | compare %f
// ASSERT: scan expected '}'

package define

import append_20104.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var x = quote($(while (true) {return quote(0)}))  // EXPECTED: regex invalid dollar expression in quote
    var y = quote($(while (true) {return quote(0)))

    if (x.size() == 1) {
        return quote(1)
    }
    if (x.get(0).value != y.get(0).value) {
            return quote(2)
    }

    return quote(3)
}
