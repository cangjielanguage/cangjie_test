// DEPENDENCE: append_20069.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20069.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt
// ASSERT: scan invalid dollar token here, do you mean '\$'

package define

import append_20069.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var x = quote($0)
    var y = quote($0)


    return x
}