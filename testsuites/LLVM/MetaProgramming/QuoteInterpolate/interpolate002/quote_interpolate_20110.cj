// DEPENDENCE: append_20110.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20110.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt


package define

import append_20110.*
from ast import ast.*



external macro test(input:Tokens):Tokens{
    var i = 1
    while (i < 10) {
        i++
        var x = quote($(break)) // EXPECTED: regex-auto invalid dollar expression in quote
        var y = quote($(break)) // EXPECTED: regex-auto invalid dollar expression in quote
        return quote(1)
    }
    return quote(0)
}