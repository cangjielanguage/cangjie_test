// ERRCHECK: %compiler %cmp_opt %f %pic_opt

package define

import append_20001.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var x = quote($( {  => }))     // EXPECTED: regex undeclared identifier 'toTokens'
    var y = quote($( {  => }))         // EXPECTED: regex undeclared identifier 'toTokens'

    if (x.size() != 1) {
        return quote(1)
    }
    if (x.get(0).value != y.get(0).value) {
            return quote(1)
    }

    return x
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace