// DEPENDENCE: main.cj
// ERRCHECK: %compiler %cmp_opt %f %pic_opt
// ASSERT: scan undeclared identifier 'toTokens'

package define

from ast import ast.*


external macro test(input:Tokens):Tokens{
    var x = quote($(()))
    x.dump()
    return quote(0)
}
