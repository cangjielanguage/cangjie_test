// DEPENDENCE: append_20003.cj main.cj
// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt


package define

import append_20003.*
from ast import ast.*

external macro test(input:Tokens):Tokens{

    var x = quote(${ => }) // EXPECTED: regex invalid dollar token here
    var y = quote(${ => }) // EXPECTED: regex invalid dollar token here

    return quote(1)
}
