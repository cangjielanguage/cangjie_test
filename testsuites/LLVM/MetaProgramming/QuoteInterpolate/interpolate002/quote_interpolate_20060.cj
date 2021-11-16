// DEPENDENCE: append_20060.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20060.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt


package define

import append_20060.*
from ast import ast.*


external macro test(input:Tokens):Tokens{
    var a = 0
    var x = quote($(a--)) // EXPECTED: regex undeclared identifier 'toTokens'
    var y = quote($(a--)) // EXPECTED: regex undeclared identifier 'toTokens'

    if (x.size() != 1) {
        return quote(1)
    }
    if (x.get(0).value != y.get(0).value) {
            return quote(2)
    }

    return x
}