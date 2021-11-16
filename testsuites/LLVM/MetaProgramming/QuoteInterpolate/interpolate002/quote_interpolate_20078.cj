// DEPENDENCE: append_20078.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20078.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt
// ASSERT: scan exponent part donot has digits

package define

import append_20078.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var x = quote($0xf.FP+1)
    var y = quote($0xf.FP+1)

    return quote(0)
}