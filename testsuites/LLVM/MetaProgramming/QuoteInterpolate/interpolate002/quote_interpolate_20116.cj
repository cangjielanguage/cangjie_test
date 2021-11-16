// DEPENDENCE: append_20116.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20116.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt

package define

import append_20116.*
from ast import ast.*



external macro test(input:Tokens):Tokens{
    var x = quote($quote(0)) // EXPECTED: regex dollar identifier must be identifier, not keyword
    var y = quote($quote(0)) // EXPECTED: regex dollar identifier must be identifier, not keyword

    return quote(0)
}