// DEPENDENCE: append_20115.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20115.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt
// ASSERT: scan invalid dollar token here, do you mean '\$'

package define

import append_20115.*
from ast import ast.*



external macro test(input:Tokens):Tokens{
    var x = quote(${'a'})
    var y = quote(${'a'})
    if (x.size() == 1) {
        return quote(1)
    }
    if (x.get(0).value != y.get(0).value) {
        return quote(2)
    }
    return quote(0)
}