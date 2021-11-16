// DEPENDENCE: append_20103.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20103.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt


package define

import append_20103.*
from ast import ast.*



external macro test(input:Tokens):Tokens{
    var x = quote($(while (false) {})) // EXPECTED: regex invalid dollar expression in quote
    var y = quote($(while (false) {})) // EXPECTED: regex invalid dollar expression in quote
    if (x.size() != 1) {
        return quote(1)
    }
    if (y.size() != 1) {
        return quote(2)
    }
    return x
}