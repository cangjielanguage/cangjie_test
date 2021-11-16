// DEPENDENCE: append_20106.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20106.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt

package define

import append_20106.*
from ast import ast.*



external macro test(input:Tokens):Tokens{
    var x = quote($(return quote(0)))    // EXPECTED: regex-auto invalid dollar expression in quote
    var y = quote($(return quote(0)))        // EXPECTED: regex-auto invalid dollar expression in quote
    if (x.size() != 1) {
        return quote(1)
    }
    if (x.get(0).value != y.get(0).value) {
        return quote(2)
    }
    return x
}