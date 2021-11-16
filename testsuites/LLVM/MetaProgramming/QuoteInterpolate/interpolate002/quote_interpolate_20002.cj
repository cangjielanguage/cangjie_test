// DEPENDENCE: append_20002.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20002.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt

package define

import append_20002.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var i = 1
    var x = quote($(i=0)) // EXPECTED: regex undeclared identifier 'toTokens'
    var y = quote($(i=0)) // EXPECTED: regex undeclared identifier 'toTokens'

    if (x.size() != 1) {
        return quote(1)
    }
    if (x.get(0).value != y.get(0).value) {
            return quote(2)
    }

    return x
}