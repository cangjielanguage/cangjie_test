// DEPENDENCE: append_20054.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20054.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt
// ASSERT: scan invalid dollar token here, do you mean '\$'

package define

import append_20054.*
from ast import ast.*


external macro test(input:Tokens):Tokens{
    var a = 1
    var x = quote($~a)
    var y = quote($~a)

    if (x.size() == 1) {
        return quote(1)
    }
    if (x.get(0).value != y.get(0).value) {
            return quote(2)
    }

    return quote(0)
}