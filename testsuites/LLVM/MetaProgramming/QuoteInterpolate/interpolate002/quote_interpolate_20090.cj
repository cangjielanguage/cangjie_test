// DEPENDENCE: append_20090.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20090.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt
// ASSERT: scan multi-line string literal must begin on a new line

package define

import append_20090.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var x = quote($"""a""")
    var y = quote($"""a""")

    return quote(2)
}