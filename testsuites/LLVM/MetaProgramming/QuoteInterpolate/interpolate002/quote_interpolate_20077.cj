// DEPENDENCE: append_20077.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20077.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt
// ASSERT: scan invalid dollar token here, do you mean '\$'

package define

import append_20077.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var x = quote($1.1e-1)
    var y = quote($1.1e-1)

    return quote(0)
}