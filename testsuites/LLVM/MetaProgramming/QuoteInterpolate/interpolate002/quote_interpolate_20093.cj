// DEPENDENCE: append_20093.cj main.cj
// EXEC-PIPE-1: %compiler %cmp_opt %f %append_pic_opt 2>&1 | compare %f
// ASSERT: scan expected ')'

package define

import append_20093.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var x = quote($(1,1))
    var y = quote($(1,1))

    return x
}
