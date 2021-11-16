// DEPENDENCE: append_20119.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20119.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt

package define

import append_20119.*
from ast import ast.*



external macro test(input:Tokens):Tokens{
    var x = quote($quote(0)) // EXPECTED: regex dollar identifier must be identifier, not keyword
    var y = quote($quote(0)) // EXPECTED: regex dollar identifier must be identifier, not keyword
    if (x.size() == 1) {
        return quote(1)
    }
    if (x.get(0).value != y.get(0).value) {
        return quote(2)
    }
    return quote(0)
}