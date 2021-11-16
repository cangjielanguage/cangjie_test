// DEPENDENCE: main.cj
// ERRCHECK: %compiler %cmp_opt %f %pic_opt
// ASSERT: scan undeclared identifier 'a'

package define

from ast import ast.*


external macro test(input:Tokens):Tokens{
    var x = quote($a) // a does not exist.
    x.dump()
    return quote(0)
}
