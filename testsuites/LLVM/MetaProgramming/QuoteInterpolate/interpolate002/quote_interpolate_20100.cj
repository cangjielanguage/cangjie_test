// DEPENDENCE: append_20100.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20100.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt

package define

import append_20100.*
from ast import ast.*



external macro test(input:Tokens):Tokens{
    var x = quote($if (true) {'a'}else if (true) {'b'} else{'c'})   // EXPECTED: regex-auto dollar identifier must be identifier, not keyword
    var y = quote($if (true) {'a'}else if (true) {'b'} else{'c'})     // EXPECTED: regex-auto dollar identifier must be identifier, not keyword
    if (x.size() == 1) {
        return quote(1)
    }
    if (y.size() == 1) {
        return quote(2)
    }
    return quote(0)
}