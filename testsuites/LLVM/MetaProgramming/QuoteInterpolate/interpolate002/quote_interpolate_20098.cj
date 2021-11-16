// DEPENDENCE: append_20098.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20098.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt

package define

import append_20098.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var x = quote($E.e(1))  // EXPECTED: regex 'toTokens' is not a member of enum 'E'
    var y = quote($E.e(1))

    if (x.size() == 1) {
        return quote(1)
    }
    if (y.size() == 1) {
        return quote(2)
    }
    return quote(0)
}
