// DEPENDENCE: append_20101.cj main.cj
// EXEC: %compiler %cmp_opt %enable_macro append_20101.cj %append_opt
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt

package define

import append_20101.*
from ast import ast.*



external macro test(input:Tokens):Tokens{
    var x = quote($match (1) {case _ => 'a'})    // EXPECTED: regex-auto dollar identifier must be identifier, not keyword
    var y = quote($match (1) {case _ => 'a'})      // EXPECTED: regex-auto dollar identifier must be identifier, not keyword
    if (x.size() == 1) {
        return quote(1)
    }
    if (y.size() == 1) {
        return quote(2)
    }
    return quote(0)
}