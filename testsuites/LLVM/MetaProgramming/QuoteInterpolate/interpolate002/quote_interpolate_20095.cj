// DEPENDENCE: append_20095.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20095.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt

package define

import append_20095.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var x = quote($()) // EXPECTED: regex invalid dollar expression in quote
    var y = quote($()) // EXPECTED: regex invalid dollar expression in quote
    x.dump()
    if (x.size() != 1) {
        return quote(1)
    }
    if (y.size() != 1) {
        return quote(2)
    }
    return x
}