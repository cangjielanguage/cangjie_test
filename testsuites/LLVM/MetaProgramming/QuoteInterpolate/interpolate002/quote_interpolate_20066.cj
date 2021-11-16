// DEPENDENCE: append_20066.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20066.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt

package define

import append_20066.*
from ast import ast.*

let a = ('a','b')

external macro test(input:Tokens):Tokens{
    var x = quote($a[0]) // EXPECTED: regex undeclared identifier 'toTokens'
    var y = quote($a[0]) // EXPECTED: regex undeclared identifier 'toTokens'

    if (x.size() == 1) {
        return quote(1)
    }
    if (x.get(0).value != y.get(0).value) {
            return quote(2)
    }


    return quote(0)
}