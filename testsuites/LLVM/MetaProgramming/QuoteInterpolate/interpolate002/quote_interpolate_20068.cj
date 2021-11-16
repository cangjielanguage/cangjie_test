// DEPENDENCE: append_20068.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20068.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt
// ASSERT: scan undeclared identifier 'toTokens'

package define

import append_20068.*
from ast import ast.*

func a(){}

external macro test(input:Tokens):Tokens{
    var x = quote($a())
    var y = quote($a())

    if (x.size() == 1) {
        return quote(1)
    }
    if (x.get(0).value != y.get(0).value) {
            return quote(2)
    }

    return quote(0)
}