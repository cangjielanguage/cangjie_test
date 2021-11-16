// DEPENDENCE: append_20072.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20072.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt
// ASSERT: scan invalid dollar token here, do you mean '\$'

package define

import append_20072.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var x = quote($0x0)
    var y = quote($0x0)

    return x
}