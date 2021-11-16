// DEPENDENCE: append_20084.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20084.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt
// ASSERT: scan  dollar identifier must be identifier, not keyword

package define

import append_20084.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var x = quote($true)
    var y = quote($false)

    return x
}