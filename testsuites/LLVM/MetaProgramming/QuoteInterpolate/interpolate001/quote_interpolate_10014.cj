// DEPENDENCE: main.cj
// ERRCHECK: %compiler %cmp_opt %f %pic_opt
// ASSERT: scan dollar identifier must be identifier, not keyword

package define

from ast import ast.*


external macro test(input:Tokens):Tokens{
    var x = quote($var)
    x.dump()
    return quote(0)
}

