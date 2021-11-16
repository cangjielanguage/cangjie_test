// DEPENDENCE: append_20073.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20073.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt
// ASSERT: scan invalid dollar token here, do you mean '\$'

package define

import append_20073.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var x = quote($0.0)
    var y = quote($0.0)

    return quote(0)
}