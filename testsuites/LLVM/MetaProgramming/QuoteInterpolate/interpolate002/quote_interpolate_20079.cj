// DEPENDENCE: append_20079.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20079.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt
// ASSERT: scan invalid dollar token here, do you mean '\$'

package define

import append_20079.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var x = quote($'a')
    var y = quote($'a')

    return quote(0)
}