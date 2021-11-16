// DEPENDENCE: append_20070.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20070.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt
// ASSERT: scan invalid dollar token here, do you mean '\$'

package define

import append_20070.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var x = quote($0b0)
    var y = quote($0b0)


    return x
}