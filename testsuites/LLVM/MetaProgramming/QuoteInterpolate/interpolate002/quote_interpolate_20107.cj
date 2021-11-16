// DEPENDENCE: append_20107.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20107.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt


package define

import append_20107.*
from ast import ast.*



external macro test(input:Tokens):Tokens{
    var i = 1
    while (i < 10) {
        i++
        var x = quote($break) // EXPECTED: regex-auto dollar identifier must be identifier, not keyword
        var y = quote($break)  // EXPECTED: regex-auto dollar identifier must be identifier, not keyword
        return quote(1)
    }
    return quote(0)
}