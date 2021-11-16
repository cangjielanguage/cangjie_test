// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt

package define

import append_20094.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var a = (1,1)
    var x = quote($((1,1)))    // EXPECTED: regex undeclared identifier 'toTokens'
    var y = quote($a)              // EXPECTED: regex undeclared identifier 'toTokens'

    if (x.size() != 1) {
        return quote(1)
    }
    if (y.size() != 1) {
        return quote(2)
    }
    return x
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace