// DEPENDENCE: append_20006.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20006.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt

package define

import append_20006.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var i : Int64 = 0
    var x = quote($true?i:i) // EXPECTED: regex dollar identifier must be identifier, not keyword
    var y = quote($true?i:i) // EXPECTED: regex dollar identifier must be identifier, not keyword

    return quote(0)
}