// DEPENDENCE: append_20109.cj main.cj
// EXEC: cjc -version
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt


package define

import append_20109.*
from ast import ast.*



external macro test(input:Tokens):Tokens{
    var i = 1
    while (i != 10) {
        i++
        var x = quote($(continue)) // EXPECTED: regex-auto invalid dollar expression in quote
        var y = quote($(continue)) // EXPECTED: regex-auto invalid dollar expression in quote
        return quote(1)
    }
    return quote(0)
}
