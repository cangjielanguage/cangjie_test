// DEPENDENCE: main.cj
// ERRCHECK: %compiler %cmp_opt %f %pic_opt
// ASSERT: scan invalid dollar token here, do you mean '\$'

package define

from ast import ast.*

let a = 1

external macro test(input:Tokens):Tokens{
    var x = quote($$a)
    x.dump()
    return quote(0)
}
