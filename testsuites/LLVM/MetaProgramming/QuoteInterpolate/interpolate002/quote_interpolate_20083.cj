// DEPENDENCE: append_20083.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20083.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt
// ASSERT: scan invalid unicode scalar

package define

import append_20083.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var x = quote($('\u{ffffffff}'))
    var y = quote($('\u{ffffffff}'))
    if (x.size() != 1) {
        return quote(1)
    }
    if (y.size() != 1) {
        return quote(2)
    }
    return quote(0)
}