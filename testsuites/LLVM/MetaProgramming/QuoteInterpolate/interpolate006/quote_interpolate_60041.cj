// DEPENDENCE: append_60041.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_60041.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt

package define

import append_60041.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var a = 1..10:1
    var x = quote($a)    //EXPECTED: regex is not a member of class
    var y = quote($a)     //EXPECTED: regex is not a member of class
    if (x.size() != 1) {
        return quote(1)
    }
    if (y.size() != 2) {
        return quote(2)
    }
    return x
}
